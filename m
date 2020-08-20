Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221624BDF0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 15:16:39 +0200 (CEST)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8kQo-0008Pi-L0
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 09:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1k8kPG-00073v-FE
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 09:15:02 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1k8kPD-00086L-6r
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 09:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=/qO+KdDcns6FF1wTz2mnRj1wYP2I+2O/OnQpuXlgKXk=; b=Gd2jRxTlUjXOkc9swWLQnhXx4L
 8BLrfcXoEyeTSV6nScob/qUH+SfGoo9NkcoWAdbN5ryRqBunv6Bp4cRhDdTEcWs2r60hzCORSLDFy
 fgTdZv8JDM8+ExRBqM0lMFdFqU3rBgEsCP17KP6FZBnkjANT+jhJeg7f/fkb7CZ7X14dG55vA4qHh
 EybIEgZ7XUAe/FLudkHlnLNKmPa9Metxsn/NVP2ytTVXpiss9wXJmd/sxk32uZxZvTMJ36TFFtYJ0
 vXprWWyLSVitj4WClPTU1zWhreA/Rbz6HV+s7n6aM8fJNFeNZbaq2gFHSeErTv6I6CmhYGZ3SMfZ0
 A7etrrWg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>, kraxel@redhat.com
Subject: Re: [PATCH] audio/jack: fix use after free segfault
Date: Thu, 20 Aug 2020 15:14:56 +0200
Message-ID: <9865109.K43dqiA3jv@silver>
In-Reply-To: <dc6f0fa4785e21fbe0c9a9f82793b5ed@hostfission.com>
References: <20200818131206.BB75F3A0B9F@moya.office.hostfission.com>
 <2455919.OPqOAOcq0L@silver>
 <dc6f0fa4785e21fbe0c9a9f82793b5ed@hostfission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 06:06:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 19. August 2020 17:57:35 CEST Geoffrey McRae wrote:
> > The ringbuffer implementation looks a bit wild:
> > 
> > /* read PCM interleaved */
> > static int qjack_buffer_read(QJackBuffer *buffer, float *dest, int
> > size)
> > {
> > 
> >     assert(buffer->data);
> >     const int samples = size / sizeof(float);
> >     int frames        = samples / buffer->channels;
> >     const int avail   = atomic_load_acquire(&buffer->used);
> >     
> >     if (frames > avail) {
> >     
> >         frames = avail;
> >     
> >     }
> >     
> >     int copy = frames;
> >     int rptr = buffer->rptr;
> >     
> >     while (copy) {
> >     
> >         for (int c = 0; c < buffer->channels; ++c) {
> >         
> >             *dest++ = buffer->data[c][rptr];
> >         
> >         }
> >         
> >         if (++rptr == buffer->frames) {
> >         
> >             rptr = 0;
> >         
> >         }
> >         
> >         --copy;
> >     
> >     }
> >     
> >     buffer->rptr = rptr;
> >     
> >     atomic_sub(&buffer->used, frames);
> >     return frames * buffer->channels * sizeof(float);
> > 
> > }
> > 
> > On both sides there is no check whether one side is over/underrunning
> > the
> > other side (rptr vs. wptr). I would really recommend using an existing
> > ringbuffer implementation instead of writing one by yourself.
> 
> `buffer->used` ensures there is no overwrite unless I have missed
> something?

Right, I missed that you are using that separate variable for that. OK then!
Typical ringbuffer implementations only have a rptr and wptr. That's why I 
missed it.

> 
> > And question:
> > 
> > static size_t qjack_write(HWVoiceOut *hw, void *buf, size_t len)
> > {
> > 
> >     QJackOut *jo = (QJackOut *)hw;
> >     ++jo->c.packets;
> >     
> >     if (jo->c.state != QJACK_STATE_RUNNING) {
> >     
> >         qjack_client_recover(&jo->c);
> >         return len;
> >     
> >     }
> >     
> >     qjack_client_connect_ports(&jo->c);
> >     return qjack_buffer_write(&jo->c.fifo, buf, len);
> > 
> > }
> > 
> > So you are ensuring to reconnect the JACK ports in every cycle. Isn't
> > that a
> > bit often?
> 
> No, please see the implementation of qjack_client_connect_ports.

Ah, you mean this entry check:

static void qjack_client_connect_ports(QJackClient *c)
{
    if (!c->connect_ports || !c->opt->connect_ports) {
        return;
    }
	 ...

It's okay. However on the long-term I would consider moving that away from the 
audio thread as most JACK API functions are not deterministic, i.e. they could 
lead to audio dropouts if executed on audio thread.

Best regards,
Christian Schoenebeck




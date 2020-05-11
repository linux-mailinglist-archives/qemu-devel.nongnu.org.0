Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D631CDDF4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 16:59:24 +0200 (CEST)
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY9tr-00088q-Kx
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 10:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1jY9sa-00078s-2r
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:58:04 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:48138)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1jY9sZ-0001I5-3Y
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:58:03 -0400
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id 5229F4D62A;
 Tue, 12 May 2020 00:58:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1589209080;
 bh=x8nxclYft20839aJShfTzQHOf+ULl+P+IstqRlAm75o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rmowts87oTc0Q8Gu3swLTL/auv7Vx+VSt1WDfccdD9e/iVFPriz+MFkFcrmLGdybW
 98vwl4V7eiJ5Zg9Bo0H/KbPvBroraquv7GsvgDqu54n/s77+iQTGrF8LgnQsfrG9WK
 ImnvuS85YLWX+dCpyfX+aiNgMX91PbconPP65Hco=
Received: from mail.hostfission.com (www1.hostfission.com [127.0.0.1])
 by www1.hostfission.com (Postfix) with ESMTP id 4C894806B8;
 Tue, 12 May 2020 00:58:00 +1000 (AEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 12 May 2020 00:58:00 +1000
From: Geoffrey McRae <geoff@hostfission.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v8] audio/jack: add JACK client audiodev
In-Reply-To: <20200511145347.GD182627@stefanha-x1.localdomain>
References: <20200511042538.60E863A0386@moya.office.hostfission.com>
 <20200511145347.GD182627@stefanha-x1.localdomain>
Message-ID: <6b06451cd2a862bc29b65aa0df304b4c@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.3.8
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 10:58:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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



On 2020-05-12 00:53, Stefan Hajnoczi wrote:
> On Wed, Apr 29, 2020 at 03:53:58PM +1000, Geoffrey McRae wrote:
>> This commit adds a new audiodev backend to allow QEMU to use JACK as
>> both an audio sink and source.
>> 
>> Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
>> ---
>>  audio/Makefile.objs    |   5 +
>>  audio/audio.c          |   1 +
>>  audio/audio_template.h |   2 +
>>  audio/jackaudio.c      | 677 
>> +++++++++++++++++++++++++++++++++++++++++
>>  configure              |  17 ++
>>  qapi/audio.json        |  56 +++-
>>  6 files changed, 756 insertions(+), 2 deletions(-)
>>  create mode 100644 audio/jackaudio.c
> 
> Cool! Out of interest, which emulated audio device do you use and have
> you had issues with buffer sizes/latency?

I now use the ICH9 device, however, I had buffer size issues with 
usbaudio.

> 
> I haven't reviewed in depth but in general this looks good.
> 
>> +typedef struct QJackBuffer {
>> +    int          channels;
>> +    int          frames;
>> +    _Atomic(int) used;
> 
> stdatomic.h isn't used directly in QEMU. Can you use "qemu/atomic.h"
> instead?

Sure.

> 
>> +static inline int qjack_buffer_used(QJackBuffer *buffer)
>> +{
>> +    assert(buffer->data);
>> +    return atomic_load_explicit(&buffer->used, memory_order_relaxed);
>> +}
> 
> Is this function used?

Nope, left behind from a prior implementation, I will remove it.


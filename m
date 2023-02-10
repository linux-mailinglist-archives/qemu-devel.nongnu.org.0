Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8B691E54
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 12:32:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQRdT-0004tu-Ud; Fri, 10 Feb 2023 06:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQRdP-0004tV-4i
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQRdN-00049q-0B
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676028724;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=938ro5/7YrWWd2XdUpwOK77ZdK889bIndqM3p9eWRlY=;
 b=cShCalewGlN1adx5+jjQ+p2tKzUsVEGFbmweOJjhMVB3Y7DEcVzN4XskW+fn91ePWjyoll
 N86ey+/6WALNVV8HMUqqsmJu2FoP9AHxa92Sce058qHu0j3rk+ooPoW7qPflx5ZY2e+XEy
 u4X4tftBNfFo+21fLPfjhE6QwTSz83I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-yMRx40grMTG2R33_zFFamA-1; Fri, 10 Feb 2023 06:32:01 -0500
X-MC-Unique: yMRx40grMTG2R33_zFFamA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 662F8857F40;
 Fri, 10 Feb 2023 11:32:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB5EF2026D4B;
 Fri, 10 Feb 2023 11:31:56 +0000 (UTC)
Date: Fri, 10 Feb 2023 11:31:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH RFC 6/7] Revert "x86: return modified setup_data only if
 read as memory, not as file"
Message-ID: <Y+YrKouh3IIL4cXK@redhat.com>
References: <20230208211212.41951-1-mst@redhat.com>
 <20230208211212.41951-7-mst@redhat.com>
 <Y+UWwJRY/ejrIqv7@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+UWwJRY/ejrIqv7@zx2c4.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 09, 2023 at 04:52:32PM +0100, Jason A. Donenfeld wrote:
> On Wed, Feb 08, 2023 at 04:12:51PM -0500, Michael S. Tsirkin wrote:
> > This reverts commit e935b735085dfa61d8e6d276b6f9e7687796a3c7.
> > 
> > Fixes: e935b73508 ("x86: return modified setup_data only if read as memory, not as file")
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  include/hw/nvram/fw_cfg.h | 22 -------------------
> >  hw/i386/x86.c             | 46 +++++++++------------------------------
> >  hw/nvram/fw_cfg.c         | 12 +++++-----
> >  3 files changed, 16 insertions(+), 64 deletions(-)
> > 
> > diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> > index 2e503904dc..c1f81a5f13 100644
> > --- a/include/hw/nvram/fw_cfg.h
> > +++ b/include/hw/nvram/fw_cfg.h
> > @@ -117,28 +117,6 @@ struct FWCfgMemState {
> >   */
> >  void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len);
> >  
> > -/**
> > - * fw_cfg_add_bytes_callback:
> > - * @s: fw_cfg device being modified
> > - * @key: selector key value for new fw_cfg item
> > - * @select_cb: callback function when selecting
> > - * @write_cb: callback function after a write
> > - * @callback_opaque: argument to be passed into callback function
> > - * @data: pointer to start of item data
> > - * @len: size of item data
> > - * @read_only: is file read only
> > - *
> > - * Add a new fw_cfg item, available by selecting the given key, as a raw
> > - * "blob" of the given size. The data referenced by the starting pointer
> > - * is only linked, NOT copied, into the data structure of the fw_cfg device.
> > - */
> > -void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> > -                               FWCfgCallback select_cb,
> > -                               FWCfgWriteCallback write_cb,
> > -                               void *callback_opaque,
> > -                               void *data, size_t len,
> > -                               bool read_only);
> > -
> >  /**
> >   * fw_cfg_add_string:
> >   * @s: fw_cfg device being modified
> > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > index a00881bc64..29a5bef1d5 100644
> > --- a/hw/nvram/fw_cfg.c
> > +++ b/hw/nvram/fw_cfg.c
> > @@ -693,12 +693,12 @@ static const VMStateDescription vmstate_fw_cfg = {
> >      }
> >  };
> >  
> > -void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> > -                               FWCfgCallback select_cb,
> > -                               FWCfgWriteCallback write_cb,
> > -                               void *callback_opaque,
> > -                               void *data, size_t len,
> > -                               bool read_only)
> > +static void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> > +                                      FWCfgCallback select_cb,
> > +                                      FWCfgWriteCallback write_cb,
> > +                                      void *callback_opaque,
> > +                                      void *data, size_t len,
> > +                                      bool read_only)
> >  {
> >      int arch = !!(key & FW_CFG_ARCH_LOCAL);
> 
> Could you leave these snippets in? This function is useful and will be
> needed in the reprise.

IMHO it is better to do a full clean revert of the patches.

Switching this one function from static to public is trivial
enough that it is not burden to do in a new impl of the RNG
seed work.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



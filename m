Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038BF44DB09
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:18:34 +0100 (CET)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDib-0006zn-2z
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:18:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlDgc-0005W3-NQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlDgZ-0002tZ-7x
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636650986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZ91ea+2rSrW57Nze2ikBPGmJFKsJz/vvnxvhMcL+W4=;
 b=PiH3Y67/8wo/HSbGbrlYj8kMsnEUBZoaHhd0jKZ+lAF4mTkqVKVtiUxKhmsQZWOs0acsTj
 o8QDbNMacltFsTQfSM2pPyD7UduKPoculvPVkEcojk2VJy8ovArLVeOqS2bTAydTmqrD1t
 qfiR/5DODcZnyQfCOZ8Gnna2ncThX+Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-Muusv0NFNiuGkGvljEUq1g-1; Thu, 11 Nov 2021 12:16:24 -0500
X-MC-Unique: Muusv0NFNiuGkGvljEUq1g-1
Received: by mail-ed1-f69.google.com with SMTP id
 i22-20020a05640242d600b003e28aecc0afso6000333edc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zZ91ea+2rSrW57Nze2ikBPGmJFKsJz/vvnxvhMcL+W4=;
 b=luD5/Iw9nVD+QGARpCXbYlmAB3MhIw8NeUDXRDtXTdSGIaT6f0GiqPiPXP4mvp2qfz
 CJ0M32U8p/RrEIBnilv9yNzsv6XBbPBkenyhZ9/vycErFcKx77poEWyPEUnGN+vH4Y5/
 HvaUC/KG4GyQM9276xsjjnmW7RFDZH7mv/jeNGk3a8tXqg4M/3Is9S28oO7qAc2SUB5w
 2Qsg6j4J09M8wf0Voar2LzqCbPk1YeZ7SrTkdygDfbE2xTQK2xUa1n2G0OigktTcLBwI
 BP5/m51jK9bIz9iyKkXwfHNkNSwlmx/r/B2kyexKJeiJrB3bpsdHxoKY9eq66zIIlKnQ
 2fYQ==
X-Gm-Message-State: AOAM533px8V6FRi0wWmQRaVoIJKFPuKmp3PGOi6j++MDUiOwupmO0VDE
 k+hBKGp6ousGYedEk4B+V874AI9yvKmH91RaC3He7Jpen1MBb/GBLbrdTplMbjyM+GQut8VAvL6
 Yg6NHRqbIPea05P8=
X-Received: by 2002:a50:c44a:: with SMTP id w10mr7629143edf.47.1636650983574; 
 Thu, 11 Nov 2021 09:16:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwScgUZG3cFJQYqcaNKZt29Ff6TRn8tS7flhHzijKvXJYy0nkpyxv9W+TxLzrSZEfwI+yb9gA==
X-Received: by 2002:a50:c44a:: with SMTP id w10mr7629111edf.47.1636650983392; 
 Thu, 11 Nov 2021 09:16:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id p23sm1985331edw.94.2021.11.11.09.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 09:16:22 -0800 (PST)
Message-ID: <8ee9adb7-791e-a4fa-6770-662af9747f06@redhat.com>
Date: Thu, 11 Nov 2021 18:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/5] gdbstub: reject unsupported flags in
 handle_set_qemu_sstep
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-4-pbonzini@redhat.com>
 <0063585f-e3e2-dc62-5d85-3864e992c953@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <0063585f-e3e2-dc62-5d85-3864e992c953@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cohuck@redhat.com, alex.bennee@linaro.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 12:38, Philippe Mathieu-Daudé wrote:
> Simpler:
> 
>   gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;
> 
>> +    /*
>> +     * In replay mode all events written into the log should be replayed.
>> +     * That is why NOIRQ flag is removed in this mode.
>> +     */
>   if (replay_mode == REPLAY_MODE_NONE) {
>     gdbserver_state.supported_sstep_flags |= SSTEP_NOIRQ | SSTEP_NOTIMER;
>   }
> 

This variant may be simpler now, but not with the next patch.  This is
because something like this is nasty (see the "=" vs "|=" difference):

      gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;
      if (kvm_enabled()) {
         gdbserver_state.supported_sstep_flags = kvm_get_supported_sstep_flags();
      } else {
          gdbserver_state.supported_sstep_flags |=
              SSTEP_NOIRQ | SSTEP_NOTIMER;
      }

and something like this is technically incorrect, because a hypothetical
non-TCG record/replay would have the same limitation in the sstep_flags:

      gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;
      if (kvm_enabled()) {
         gdbserver_state.supported_sstep_flags = kvm_get_supported_sstep_flags();
      } else {
          gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;
          if (replay_mode != REPLAY_MODE_NONE) {
              gdbserver_state.supported_sstep_flags |=
                  SSTEP_NOIRQ | SSTEP_NOTIMER;
      }

>>
>> +
>> +    if (new_sstep_flags  & ~gdbserver_state.supported_sstep_flags) {
>> +        put_packet("E22");
>> +        return;
>> +    }
> 
> Please does this change in a separate patch, after moving
> to GDBState.

Honestly it seems overkill.  The point of this patch is to add _this_
check, everything else is just a means to this end.  Before, there was
no concept of supported flags, so there was only one variable.  Now that
there are two variables, it makes sense to move them to GDBState.  Also,
with no concept of supported flags it would not be possible to avoid the
get_sstep_flags() function.

If I had to split the patch further, I'd first move sstep_flags to
gdbserver_state.sstep_flags, and then do everything else, but IMO this
patch is already small enough and easy enough to review.

Paolo



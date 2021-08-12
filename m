Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACD73EA9CC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:52:04 +0200 (CEST)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEEs7-0006AF-J8
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEEpe-00030q-7L
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEEpc-0001Xs-Pv
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628790567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeZxhYJY2CqYTo0ZyV9hsxbbTipkTubk4HpuqJ0VMtk=;
 b=iF6K0Sq54jGpPN81krRQ5NKtmeWot1qIeMHFpXJzaYkhITHxDFs6m+JUf1fuQlR93/GMXG
 bdQQyCOTY0uENkfM8xY7KrFP6kWclW+xVX03p8yHBUP/UHxTnvEZr+XotSv+7z2TW23k6K
 1pyvnug7pSD/egR6q3QPUb7iGJuHSQA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-395MnkcSPjyWpjcBLQh_bg-1; Thu, 12 Aug 2021 13:49:26 -0400
X-MC-Unique: 395MnkcSPjyWpjcBLQh_bg-1
Received: by mail-ed1-f71.google.com with SMTP id
 l18-20020a0564021252b02903be7bdd65ccso3436055edw.12
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 10:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DeZxhYJY2CqYTo0ZyV9hsxbbTipkTubk4HpuqJ0VMtk=;
 b=lGD0bEgIWzBbhfIRPuZ7WOAuu+UWOmg1nUffeuqISSobmAz8WanvGbExN4zXZ1meux
 gvNiHjlpgiTtTj7FL4W7ars8cVlKSPBIr3C96VCl1WlTPftqMkOEv7LKbGtdu5FwXVFL
 ou1CfVh2I9FmAg7Xj/IwAq1waK2Z1FLSU59/9SrnUTY4xiOvJZpkMmPI15oSxH1PfUhT
 EYgt9F9hoXEl52NHRjN2Odc8tQv0SMSI7AqphZBinklt3ZNlUFFAdIlx1DXtKdV7o3fL
 bteHVM3rTmNA/G4fvdmy+CvyMltRs/f+yz6sjuKIK/J/eJOyB1ddRsNY8TeY38mZQgMI
 EyrQ==
X-Gm-Message-State: AOAM532upSWEpwk2IQ+0aFDxoQ8vhtoKZB2cZozeVWGUd7GzYRJjQMVa
 ah7yheFwpRBxIz76d8/kjrxBYdnDc1aqsJR48jy3hC6g9GytJg1OhJYRtDz7RsG1QyIZ1DYxKIo
 kAm1CyIs2iqOLcFU=
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr4876825ejc.494.1628790565450; 
 Thu, 12 Aug 2021 10:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5NERRXj2OTmLJX0LHx32P0Z52x8a4gU8cBpkz7LIPUV50H3NFCaJrzsMFXgjcavSlF2mbiw==
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr4876815ejc.494.1628790565294; 
 Thu, 12 Aug 2021 10:49:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g9sm715029ejo.60.2021.08.12.10.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 10:49:24 -0700 (PDT)
Subject: Re: [PATCH] configure: Remove spurious [] from tr
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, eblake@redhat.com, philmd@redhat.com
References: <20210812110942.19065-1-dgilbert@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7f58a3cb-01ff-76e8-018a-0be3db62fd74@redhat.com>
Date: Thu, 12 Aug 2021 19:49:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812110942.19065-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/08/21 13:09, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> ShellCheck points out that tr '[a-z]' actually replaces the []'s
> and only the a-z is needed.
> 
> Remove the spurious [] - although in this use it will make no
> difference.
> 
> Fixes: bb55b712e8dc4d4eb515144d5c26798fea178cba
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 9a79a004d7..5bb8c2a59d 100755
> --- a/configure
> +++ b/configure
> @@ -4549,7 +4549,7 @@ if test "$gprof" = "yes" ; then
>   fi
>   echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
>   for drv in $audio_drv_list; do
> -    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
> +    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr 'a-z' 'A-Z')
>       echo "$def=y" >> $config_host_mak
>   done
>   if test "$alsa" = "yes" ; then
> 

Do we want this in 6.1?  For the next release I'm moving all audio stuff 
to meson anyway. :)

Paolo



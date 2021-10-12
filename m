Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741742A7EA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:08:08 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJNv-0004AK-1O
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maJLt-0002Iq-Ks
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:06:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maJLo-0003Fn-AM
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634051152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5i94VlogtB6bYWhbGaw4GEo1CmM/fnoqA37Yqori3FU=;
 b=eS9/04vUKY2TFtQhKJ6o06LbanMYSBaXggBnTzAzCAxP4tN1qL+7bxBRt5RUJT4FFKfLZ3
 M8eTId9Zkt9PuBAbrtiwLu8f2kQIO0gOah2J8zNwEv8QnerfsLTsxWU6T1cBONnJLB7Pjo
 kTejheZtAIQoYY4XnmOdYekq4HaEIv4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-cH8zC7NvMbO2XVpM8ZY2vg-1; Tue, 12 Oct 2021 11:05:51 -0400
X-MC-Unique: cH8zC7NvMbO2XVpM8ZY2vg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so152028edl.18
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 08:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5i94VlogtB6bYWhbGaw4GEo1CmM/fnoqA37Yqori3FU=;
 b=KIv1E4Bs38i2meGhYyGiFEs55aw2CFbJLK6jW1UNjJF55D74SVEuoMvBBul9YsASFz
 Tr+R+ljrQPiUb+qlgeeDRYKYG5pleJN4SB/xqV10yn/3k5VX7siUPf0zAoV2vw156JFo
 YRWJX75/CVwN6j3lsD63IpkkXx0IDoXJuDzwesLYEozZWIhgJyXHfeXdRJCdkqRNa6ml
 ZfpCK3b3soQ4ZSBx7WbFFtMnaWFdz3dKgcHaNX6Ighvd2N8Cwaf34FBtfdBtB5h7yvLN
 0TMSzBpdtgFHtxDf2xxE7EOIbWKzNfFxK+mXb5d7w/mE7o8PHRSagTJPu8lzr3tLYPPt
 75uw==
X-Gm-Message-State: AOAM533Dwx4FewN+N+ZHNUJYc/hbMqgmj79E0/bOt/TCk9+0EmAoapf/
 iKwJjfBGIg6jjNcRPEL7UUh2m+EVOxtCXibGXrw5NwJ66vDn7dzcwxCOrk3GeZnLP92ttbxehNA
 v1EZ6T5wqurc8LBU=
X-Received: by 2002:a17:906:c7c1:: with SMTP id
 dc1mr34739572ejb.6.1634051149858; 
 Tue, 12 Oct 2021 08:05:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8rCN6JiDYDqannVculi1R7wEV/tuLisFLwHrcbqVgerH2bFeMSMdjPvgEPhVZZ1eChWsVMw==
X-Received: by 2002:a17:906:c7c1:: with SMTP id
 dc1mr34739551ejb.6.1634051149631; 
 Tue, 12 Oct 2021 08:05:49 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id l16sm5001494eje.67.2021.10.12.08.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:05:49 -0700 (PDT)
Subject: Re: [PATCH v2 21/24] configure: remove deprecated --{enable,
 disable}-git-update
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-22-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <847f486f-44b1-32b0-7353-362883b0add1@redhat.com>
Date: Tue, 12 Oct 2021 17:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-22-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.12, Paolo Bonzini wrote:
> The options were deprecated in 6.0.  That said, we do not really have a
> formal deprecation cycle for build-time changes, since they do not affect
> users.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130829.632254-16-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/configure b/configure
> index 33d330dcc9..d00ba0cbd2 100755
> --- a/configure
> +++ b/configure
> @@ -1483,14 +1483,6 @@ for opt do
>     ;;
>     --with-git=*) git="$optarg"
>     ;;
> -  --enable-git-update)
> -      git_submodules_action="update"
> -      echo "--enable-git-update deprecated, use --with-git-submodules=update"
> -  ;;
> -  --disable-git-update)
> -      git_submodules_action="validate"
> -      echo "--disable-git-update deprecated, use --with-git-submodules=validate"
> -  ;;
>     --with-git-submodules=*)
>         git_submodules_action="$optarg"
>     ;;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>



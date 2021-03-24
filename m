Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B63480FF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:54:28 +0100 (CET)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8eB-00030S-KW
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Uj-0002oQ-Qr
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:44:41 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:36695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Ui-0000bv-CG
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:44:41 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 w1-20020a4adec10000b02901bc77feac3eso6071507oou.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hx2p14Er2yZ3WFAp4m23jDPGqN8PVhgBzt2Gm3Dkx5Q=;
 b=W46YyKOl3R8pf+hM7H5k4pNM4GzBXvoQt/Qx2pJClyRPsYgnd61VG/Z2k0I2Sk3aef
 YC89Xt6s7t8s/K7XMOIeCfuzbAjGBTpF8sp+Yzy++REPQinyvMd3LEoF8ZZyMagWS5vh
 Rc8o2K4iCL441rTIdlmOzMLuiYOfA64Ma6WkFZB8cnraKcbbcRTwHCfMsdo+tNA7zvNR
 lBgidcyTe37Pt6pA2G+tqs3HKHCFDpcbn86kA3dlNKbAlA7dueqMhKn6HIviJZc39zNJ
 WzR2nTh+e3h7Hceik4ZOPktdArebcFA3LWPDULRaEPV2fXso2Tg6R+rZZfbHPVMAyVQi
 k1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hx2p14Er2yZ3WFAp4m23jDPGqN8PVhgBzt2Gm3Dkx5Q=;
 b=m0OKk4LBZZz588pgYRpljwlMUmnd3ROTWn9ku81yNPMoz7G/nr8DOGhAez9VngBZ/u
 FytRG+mUaGDdkWglvqz8FXJICdquHZayBUynjJr3NcWLsX/0orIhW1Vi93o3e+zNdUB3
 uuwdLkgTgm6fwH8810vk/HTmtjfhKJ1A9OMFr40M2p+L7DuuosaESyAwRDxGDrvpigCU
 qswpodeCqdbO0ZNBOHfk1h97oz2YtA3qcaZxOOR5XFVg0grMVraw2e4Jc+VThQAxG0F0
 nLIRtVZDoAt0tMmSomDKlAwVHgo2gBdJHhpW5pTOkDFrEf/0RGreXx7OLVG3nnaFRvTs
 KVPw==
X-Gm-Message-State: AOAM531TW0UVjQi99TWmCEjLkd8j4KbvDO9UxuPfUqqFK0ldsodofIlj
 1W47YQheMghk/bhz8iF+twcf9w==
X-Google-Smtp-Source: ABdhPJzabKa307TSKJOL4liL1Ptrzch22fdoa9NUoKlzVmcWq5IDffYUuNOm2eHTifnynfFIlr/4Ug==
X-Received: by 2002:a4a:a223:: with SMTP id m35mr3869718ool.39.1616611479314; 
 Wed, 24 Mar 2021 11:44:39 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id f129sm576698oia.9.2021.03.24.11.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:44:38 -0700 (PDT)
Subject: Re: [RFC v11 16/55] target/arm: only perform TCG cpu and machine
 inits if TCG enabled
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-9-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b339a569-096d-0451-061a-ee56390458f0@linaro.org>
Date: Wed, 24 Mar 2021 12:44:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> of note, cpreg lists were previously initialized by TCG first,
> and then thrown away and replaced with the data coming from KVM.
> 
> Now we just initialize once, either for TCG or for KVM.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.c     | 32 ++++++++++++++++++--------------
>   target/arm/kvm.c     | 18 +++++++++---------
>   target/arm/machine.c | 20 +++++++++++++-------
>   3 files changed, 40 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


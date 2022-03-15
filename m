Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50674D9A91
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:45:34 +0100 (CET)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5cL-0001i3-OM
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:45:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU5NE-0006Iu-2z
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:29:56 -0400
Received: from [2a00:1450:4864:20::629] (port=46827
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU5NC-0001Vc-BZ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:29:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id qx21so40467720ejb.13
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ETUdU9Cu/udWUMs2R9/xSoMquLBWCNSZoaOLJwCD1kA=;
 b=DGs2i8x/JR+amYBTn2qeFSOdcB0HdT5/QJSyZGor8kKsvSfDjKrtTcNxgkJ1zJ6NHf
 VExuR3wHRSqYjLtucp+e1rJqZD78QdlyqC4gm6GtDvO7BoaqFNe1dka/OEgESDNORXPq
 MEx6C0Uzp0R3zXKAduxOlYin31sIKAgnbyF4a/OwrqdEL2pEiSlOVGWSw0kSTkobH+qO
 5EEyvsUIR7ARMUCq6MnlJxuseD+ED7FSvu8APbo6i/gmmWAoW9Lis1tR1uFCLdxkudBP
 kEYZjMhMPbX0j0LYwJ9bTRhMbL7cdPk82sBKN8bdDD60guomo4Sp5VtgshQFdAo7OW0Z
 a97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ETUdU9Cu/udWUMs2R9/xSoMquLBWCNSZoaOLJwCD1kA=;
 b=4zHhFxyHeSH/mQdgOf/usWsvDqGoGX71cB6dERgn6Vr4JQZpRZqj50xTRNI8QvX57D
 REWBCvyUQTsNi2Ptu73jaEO1Idn3BmnimbPFn0xawVpi/b7j2MNkKW8ZIICSfsSgEBrj
 VXF2sM88wNvTWNUwkueKX1IVH6XoFwqi3nYFsOyY9+GCYC5Bxc1wnCoOSbOxGyGwor6K
 15hGd5wEgixEiHWJV2nS6r+d9uGdSqSRsmIwFNfA17jz05d8Tb76O1CFw6rjQ13kQf8T
 uo9RVTOpG0eBO7fifJexZslxPptxTgMyU7iL8KzHKjZ2+TcfObtXNG25nt1vYHvNI13X
 35ig==
X-Gm-Message-State: AOAM533yHMiBP6XnaHyldqTUs3yC+PkpHQUBY56DegoMr+AGDqCkbSFR
 JilEVgW0hAPI4lWnzba52LY=
X-Google-Smtp-Source: ABdhPJwreWIyvd+gmgWjWg4+u1AU+1P7ihXzNxGcnqbcaC9Hv7B/vdKM22aub0Pyk6OyI8hH+s4N0g==
X-Received: by 2002:a17:906:9b94:b0:6db:67b:a6d6 with SMTP id
 dd20-20020a1709069b9400b006db067ba6d6mr21583924ejc.367.1647343792092; 
 Tue, 15 Mar 2022 04:29:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 e19-20020a056402105300b004162d0b4cbbsm9450152edu.93.2022.03.15.04.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 04:29:51 -0700 (PDT)
Message-ID: <45bfbd51-7da1-e617-60e6-3584b3485a43@redhat.com>
Date: Tue, 15 Mar 2022 12:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] hyperv: SControl is optional to enable SynIc
Content-Language: en-US
To: Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org
References: <20220216102500.692781-1-arilou@gmail.com>
 <20220216102500.692781-2-arilou@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220216102500.692781-2-arilou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 11:24, Jon Doron wrote:
> +    qemu_mutex_lock(&synic->sint_routes_mutex);
> +    QLIST_INSERT_HEAD_RCU(&synic->sint_routes, sint_route, link);
> +    qemu_mutex_unlock(&synic->sint_routes_mutex);

Hi,

I don't see any access to sint_routes outside hyperv_sint_route_new and 
hyperv_sint_route_unref.  Am I missing something or is this just for 
debugging?  If so, using the _RCU functions is not necessary.

Otherwise everything looks good, thanks!

Paolo


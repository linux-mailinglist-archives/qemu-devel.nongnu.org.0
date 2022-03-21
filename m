Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0604E26AD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 13:36:48 +0100 (CET)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHHD-0008T1-Bh
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 08:36:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWHDw-0006uB-Am
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 08:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWHDo-0005Dh-MU
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 08:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647865995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMEecMKRCA/TNZTdrBulYveDs4q4KN2lCAhZ0/vgQFk=;
 b=f7A1Vr9q9osch1YLtFXzTXsNQg8FTZHNVpU7slGFsu5FockxhtojKvgrDYyNMORkxyYtfx
 ePufIhsFbEWdTL9KrBelDmA1wvjlFMvHw9NPsocq8iMYD2lPdGy/REZFBtFovV0B6Wgtie
 TBamqdwSoCqb/SrlHMXfM9gx+Zt5DSQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-OJVPCyAuN5S6WLHZEAAr5A-1; Mon, 21 Mar 2022 08:33:14 -0400
X-MC-Unique: OJVPCyAuN5S6WLHZEAAr5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 n19-20020a7bcbd3000000b0038c94b86258so2334236wmi.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 05:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=dMEecMKRCA/TNZTdrBulYveDs4q4KN2lCAhZ0/vgQFk=;
 b=sCcJlmnddlkLoBllsFmMHvu+izOFc3OU0HR7ZfpjeSACB4jnP8M/5aURaFx10UyJ95
 1IsE6rax0eQgQFRSbZ3kquk4Dd8xD7V7GuoZf6kNLjwBt0am00Mj2RSHTQNSPOQQjyxV
 /E7N99KM86IzdiokvSxIp40NBBCcolOJvnpg0fVyc95P/OGPsoKZjlViVRbStSBuzPNz
 Nq+HH+aZmlyBREMm3+hR4bdJ6E0yUw12tFBMkKYcoG0uk98cpE2g9JMdoHkXEmY/DCUe
 v+frpmX1EG7jFuta1zDoKo2x70X3fqmGwNZdVs0lnXb4IEL2hGbzveA6t1PnuZyyMkkn
 8Tnw==
X-Gm-Message-State: AOAM531ajUdw540qFBNgWUp/BALALJ6rWTz4ZW0nvukmHfZSYT0P5Sci
 +45x3RMOZMEPvHmlA1MMkeExxwGaoqoXzNc3jsQFI6ALFSEJzQzKbJ4BHhXuuSvXZna2hcjCNPZ
 GrBck0hhr1JYm1Mo=
X-Received: by 2002:adf:fb90:0:b0:203:b456:c71e with SMTP id
 a16-20020adffb90000000b00203b456c71emr18224209wrr.244.1647865993098; 
 Mon, 21 Mar 2022 05:33:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgw93w9CAHkEM0rKakuOSI/0sVYXHIhiwwHDtu0ExoXszBGvWg/tL7sxFcufF2ivH+be5Pqg==
X-Received: by 2002:adf:fb90:0:b0:203:b456:c71e with SMTP id
 a16-20020adffb90000000b00203b456c71emr18224193wrr.244.1647865992880; 
 Mon, 21 Mar 2022 05:33:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d674b000000b0020402c09067sm5830673wrw.50.2022.03.21.05.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 05:33:12 -0700 (PDT)
Message-ID: <ade8b532-604b-8ae5-0ce3-4a42790a2669@redhat.com>
Date: Mon, 21 Mar 2022 13:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-9-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 08/11] target/s390x: vxeh2: vector {load, store} byte
 reversed element
In-Reply-To: <20220308015358.188499-9-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> From: David Miller <dmiller423@gmail.com>
> 
> This includes VLEBR* and VSTEBR* (single element);
> VLBRREP (load single element and replicate); and
> VLLEBRZ (load single element and zero).

"load byte reversed element and ..."

> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Message-Id: <20220307020327.3003-6-dmiller423@gmail.com>
> [rth: Split out elements (plural) from element (scalar),
>       Use tcg little-endian memory operations.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

[...]

> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index ee6e1dc9e5..b80f989002 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -1027,6 +1027,14 @@
>      F(0xe756, VLR,     VRR_a, V,   0, 0, 0, 0, vlr, 0, IF_VEC)
>  /* VECTOR LOAD AND REPLICATE */
>      F(0xe705, VLREP,   VRX,   V,   la2, 0, 0, 0, vlrep, 0, IF_VEC)
> +/* VECTOR LOAD BYTE REVERSED ELEMENT */
> +    E(0xe601, VLEBRH,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_16, IF_VEC)
> +    E(0xe603, VLEBRF,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_32, IF_VEC)
> +    E(0xe602, VLEBRG,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_64, IF_VEC)
> +/* VECTOR LOAD BYTE REVERSED ELEMENT AND REPLOCATE */

s/REPLOCATE/REPLICATE/

> +    F(0xe605, VLBRREP, VRX,   VE2, la2, 0, 0, 0, vlbrrep, 0, IF_VEC)
> +/* VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO */
> +    F(0xe604, VLLEBRZ, VRX,   VE2, la2, 0, 0, 0, vllebrz, 0, IF_VEC)
>  /* VECTOR LOAD BYTE REVERSED ELEMENTS */
>      F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
>  /* VECTOR LOAD ELEMENT */
> @@ -1081,6 +1089,10 @@
>      F(0xe75f, VSEG,    VRR_a, V,   0, 0, 0, 0, vseg, 0, IF_VEC)
>  /* VECTOR STORE */
>      F(0xe70e, VST,     VRX,   V,   la2, 0, 0, 0, vst, 0, IF_VEC)
> +/* VECTOR STORE BYTE REVERSED ELEMENT */
> +    E(0xe609, VSTEBRH,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_16, IF_VEC)
> +    E(0xe60b, VSTEBRF,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_32, IF_VEC)
> +    E(0xe60a, VSTEBRG,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_64, IF_VEC)
>  /* VECTOR STORE BYTE REVERSED ELEMENTS */
>      F(0xe60e, VSTBR,    VRX,   VE2, la2, 0, 0, 0, vstbr, 0, IF_VEC)
>  /* VECTOR STORE ELEMENT */

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CAE516B2E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 09:23:20 +0200 (CEST)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlQOt-0003di-Aq
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 03:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlQMN-0002nT-Ls
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlQMJ-00045H-JT
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651476038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAFN8wRoX4g2PKgEYIdsgenC7troHOcVHBJd4DHBz/c=;
 b=TuEw0Jp0ovfFcanxqroTe9Pjl8pHqlODyracImMScYWo11UJNQkDzPZBLtCPxhxYU6/alG
 wLhgLAhrUVm6YgX8D/Jxqg7lb/Ns3KFqthmkO2X/hKU08uGiP9GxR2wwisBCpuhyCVQCBg
 qomIpqPWGihihAtg7gYzgSF4BANZop0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-b90iHfEwOEGgvEuuO1rDMA-1; Mon, 02 May 2022 03:20:35 -0400
X-MC-Unique: b90iHfEwOEGgvEuuO1rDMA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso5041355wrp.21
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 00:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PAFN8wRoX4g2PKgEYIdsgenC7troHOcVHBJd4DHBz/c=;
 b=hsb+3VQ15j0NJ2v84+RIiPEvbB5CfPEYFxMSb5OUPH0LHMw55Z2ui4IMQPeZgaQ4DW
 OYPq/3LfZxTd5Xl4Scg+2Lga+Vswg0w3EANWVSR7FHHu5s7j0VSq6xedoE+2YBtZYQZB
 kKifvhTmefnzTBG5Rizwbipt7DKhfbWNQNRQbrCy4P3eQwfGrVZ+w27EsYG39CZYoukX
 2IoJ2qspWO2nNOOSuQI4c1UYJmWGx8aQ6HhA24E6evhX676jrcexbuU2Zk81mhPUqqXq
 LSNk2nRouCkH3VPfQ8rkqRFy3SMEukDTY15ut72gSq55j8yNLWIZeVnmMz3iMocDdVUK
 6w4A==
X-Gm-Message-State: AOAM533YAq0GrLZNCg+zvelvLMhkfV1yXH24zZ20di/WHWYDP+u3LgyB
 ZHbFbYIitkddBx6MBYsVwLyiS59fu3oPKrZeiwLIQ5agpjohlHYJRAJxSgmTioeTp0zm4Iaxqod
 ui5wW/gB5TwIT9r8=
X-Received: by 2002:a05:600c:4ed1:b0:393:e994:57cc with SMTP id
 g17-20020a05600c4ed100b00393e99457ccmr9756362wmq.198.1651476034532; 
 Mon, 02 May 2022 00:20:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9vGMXxyPKUX30px/nX3V3122dw0koiu6yVDLAG9gRrvdPt6SGTnPkgwbiYoc6iM4g+L+oiQ==
X-Received: by 2002:a05:600c:4ed1:b0:393:e994:57cc with SMTP id
 g17-20020a05600c4ed100b00393e99457ccmr9756345wmq.198.1651476034328; 
 Mon, 02 May 2022 00:20:34 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05600c1c9000b003942a244f39sm5503483wms.18.2022.05.02.00.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 00:20:33 -0700 (PDT)
Message-ID: <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
Date: Mon, 2 May 2022 09:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements
 Facility 2
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 David Miller <dmiller423@gmail.com>
References: <20220428094708.84835-1-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220428094708.84835-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=unavailable autolearn_force=no
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
Cc: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/04/2022 11.46, David Hildenbrand wrote:
> Implement Vector-Enhancements Facility 2 for s390x
> 
> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
> 
> implements:
>      VECTOR LOAD ELEMENTS REVERSED               (VLER)
>      VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
>      VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
>      VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
>      VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
>      VECTOR STORE ELEMENTS REVERSED              (VSTER)
>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
>      VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
>      VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
>      VECTOR STRING SEARCH                        (VSTRS)
> 
>      modifies:
>      VECTOR FP CONVERT FROM FIXED                (VCFPS)
>      VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
>      VECTOR FP CONVERT TO FIXED                  (VCSFP)
>      VECTOR FP CONVERT TO LOGICAL                (VCLFP)
>      VECTOR SHIFT LEFT                           (VSL)
>      VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
>      VECTOR SHIFT RIGHT LOGICAL                  (VSRL)

Thanks, queued to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas




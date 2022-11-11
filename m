Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C782625927
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:16:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otS0e-0006t9-HM; Fri, 11 Nov 2022 06:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otS0b-0006pw-SE
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:15:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otS0Y-0000hF-DP
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e15Z8lb9dnawoHBULbI2ZDUYUWGV4/XUt9FED20Xo1Y=;
 b=FfQG6uRzKDLBVdFVLp2dsmamWeYAdobkDAER0buCm7kHZw/bb6R+QB05vZUTg2m3WIZ/q4
 btNZkIIwJ9puRqHjo6TZCl5yWGMUnuvga/R1xUFN0E1L8NmZ/NKHMBoW26Q6sxtrHeFwVq
 v7ravQGAFL51KhHBjPjE/v04txjpfB0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-wtFq61KXMDGH8d_nJjHuGw-1; Fri, 11 Nov 2022 06:15:36 -0500
X-MC-Unique: wtFq61KXMDGH8d_nJjHuGw-1
Received: by mail-qk1-f197.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso4517143qkp.21
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e15Z8lb9dnawoHBULbI2ZDUYUWGV4/XUt9FED20Xo1Y=;
 b=5v39W0NuY0DftZ3n9NZrSZdXWu8GX2bvfkNWKcMeFl7olKDjEgBcS6cN48v7T3v3Ae
 MarFGcwV0KmXwIso/ZovjXhS/tXhWdUGYgTjiJHEeQmzKylGiEhl3Z4tPuc7VNlC0i8H
 aBaBuMyE2TtuFkrSeU6yAp5lcZq7L8Fe+U5Ym0eF5I3a+wxrxM15D445htMIAaGdAdSS
 oUMNhIy0sdL5BZFpjv2JH6uNewhu/o5eUuu55UybvjC7Yi2TWXaiPmkT9el/rnrCS/8/
 WBrEYMWYk01NLrj24bJOVf166zJzOfk50vurZGXSv6S1+LFNXW6jav6Vm+LAVAULd+bu
 zRhQ==
X-Gm-Message-State: ANoB5pmJRutOdADhQBFIg+S/kJoLtUwaW1s6IKEesCqWsMNmBx57huJX
 Z54/Rx+ahK8U+Wigam4o6mASwhT0Vtjl2sr3tAZH0ASpH099wDYtbDwNluTi4eehaldjceM5QT8
 OVfUFf7JqMhulWMA=
X-Received: by 2002:a37:640c:0:b0:6fa:5257:bcae with SMTP id
 y12-20020a37640c000000b006fa5257bcaemr588616qkb.411.1668165336160; 
 Fri, 11 Nov 2022 03:15:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5PNwvJsEfwLifvhi4+1kRcIunc6LuIzNazZoevCTzK8wJcfxxoW72+7+u6lCPFoZEiBKIJaQ==
X-Received: by 2002:a37:640c:0:b0:6fa:5257:bcae with SMTP id
 y12-20020a37640c000000b006fa5257bcaemr588604qkb.411.1668165335979; 
 Fri, 11 Nov 2022 03:15:35 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bp44-20020a05620a45ac00b006f956766f76sm1274041qkb.1.2022.11.11.03.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:15:35 -0800 (PST)
Message-ID: <a5862180-68a3-82a7-99d5-3adaa7fa51ef@redhat.com>
Date: Fri, 11 Nov 2022 12:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 04/13] block: Remove drained_end_counter
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: stefanha@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-5-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108123738.530873-5-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 08/11/2022 um 13:37 schrieb Kevin Wolf:
> drained_end_counter is unused now, nobody changes its value any more. It
> can be removed.
>
> In cases where we had two almost identical functions that only differed
> in whether the caller passes drained_end_counter, or whether they would
> poll for a local drained_end_counter to reach 0, these become a single
> function.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A47269C62F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU13g-0006Xk-KW; Mon, 20 Feb 2023 02:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU13Z-0006XS-AZ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:57:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU13X-0006TC-AT
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676879870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXtMiq5BmyeVGZY4xHKVuLKJGck9UX02kyioaS+xNgQ=;
 b=ZvnhWE6wH/js/Q18ge7hOiwOoOm3egHdRs3cjoVOscJvJEw9Vre7THWdB1OfLF+AlkvR0K
 qwbxRA/hpTH/REpNtuWUXqTH6V+ffW6lw6Pvt4BVrij9XL1sg6T32FJGsSAgMhqka3gL7/
 RKN1Iu8JmyUB893cOYXj1W/oFYBgjLg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-HVWIr88iPpO9GEnQH_u_EQ-1; Mon, 20 Feb 2023 02:57:41 -0500
X-MC-Unique: HVWIr88iPpO9GEnQH_u_EQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m24-20020a7bce18000000b003e21a3f4e84so1113188wmc.8
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 23:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zXtMiq5BmyeVGZY4xHKVuLKJGck9UX02kyioaS+xNgQ=;
 b=oc3sw+BPn83K6rdptyT1zTo+U3qOzRmLe91NXNgkjZnsSMETi3TrohjsdnGliokTKm
 0g1LVsdXnXzDiKiVdA8Lq9GI+WC+liKLKX2OOtuhP1d4lQOLO1VRuRycjoyAW3E4vba9
 V+QHhzIdV6aUyr0dvwQFCYqASo3+bdu2TqGrTFAAtq9FCNhmokIR+idEaY9bRLk64aIo
 6en5C7aXeemwBExTjrTk9yXzsA3HtTFCg1SUyA0SFYnSZKDSJ4Zo7m488E4c9uNBosqP
 8uSpq0FO2RVmshUaY1g7fiAaGMgy/Cm0QAN4R71nw+SfanMyIR3XMIDfxrmlSfl3XHMu
 16Xw==
X-Gm-Message-State: AO0yUKXtScNVoUJ9RzE1/8xImZRrBiqRYRSz9rXHwLgIJg7DV+JIMUlI
 uNP0l5TudIFCVTjMonWgxF4yy6sH86T8cYM8unQ0t9KsWi88Pa9BpdAcWaoiwJ+8oZ5Kv0t18Zh
 BOhV3RVYBrUw4Oqc=
X-Received: by 2002:a05:600c:3420:b0:3e2:153e:6940 with SMTP id
 y32-20020a05600c342000b003e2153e6940mr673374wmp.3.1676879859023; 
 Sun, 19 Feb 2023 23:57:39 -0800 (PST)
X-Google-Smtp-Source: AK7set833tXKiCilmqUVYuz83UexjOGJv2jtGDeE6GCWjatCr5j4vnePl9iemBrus22N/FOaktKxnA==
X-Received: by 2002:a05:600c:3420:b0:3e2:153e:6940 with SMTP id
 y32-20020a05600c342000b003e2153e6940mr673367wmp.3.1676879858758; 
 Sun, 19 Feb 2023 23:57:38 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 y24-20020a1c4b18000000b003e22508a343sm578653wma.12.2023.02.19.23.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 23:57:37 -0800 (PST)
Message-ID: <e7b799a4-c718-00a4-9107-9ea222fdd162@redhat.com>
Date: Mon, 20 Feb 2023 08:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 00/27] target/s390x: pc-relative translation blocks
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/01/2023 21.07, Richard Henderson wrote:
> This is the S390 specific changes required to reduce the
> amount of translation for address space randomization.
> 
> Changes for v3:
>    * Rebase and fixup conflicts.
> 
> All patches are reviewed.

  Hi Richard,

as far as I can see, this series has not been merged yet? Were there any 
issues left here? ... soft freeze is coming rather sooner than later ... do 
you want me to take this trough my s390x tree, or will you take it through 
your tcg tree?

  Thomas



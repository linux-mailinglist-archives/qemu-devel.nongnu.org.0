Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60646AF64F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:01:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZdT9-0001XZ-IR; Tue, 07 Mar 2023 14:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZdT8-0001XP-6r
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 14:59:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZdT4-0005Jb-R8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 14:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678219165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Nc/IpMY+uQZlHDg1wk13U+J95fBrgT/jTc2mhs50is=;
 b=OqwCwIJgrg0Pcss5UWVtvru3O69hCgGHoBtIpPSX9X+AAKJPkUPEHD9K4KuK1+n7bIoxFf
 wHi+whNB3BioANKbtpI2y8ib8TP6R2usQ8eHo6ydqGxeg2WKKwJTN/xRjzORpb5bvovrlB
 YY4k1/Fv24qHGwkWJlpP2U3OipzZSHI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-d0C2fJ9GPIyFJ6HSTV6hwg-1; Tue, 07 Mar 2023 14:59:24 -0500
X-MC-Unique: d0C2fJ9GPIyFJ6HSTV6hwg-1
Received: by mail-wr1-f69.google.com with SMTP id
 7-20020a5d47a7000000b002be0eb97f4fso1956429wrb.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 11:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678219163;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Nc/IpMY+uQZlHDg1wk13U+J95fBrgT/jTc2mhs50is=;
 b=J77WovG4Vdg4pHtoeTivFLi5eGaPN+vf7YdDY57CGmMDE4ecZPcJarfIxexqjhFR1U
 iQ8ZHBLJPybL5w+baiux0LgsvjWFOXfYGStSyezLfCbq3HrGzBA/+OsclnD5/Qze/dNt
 Zna/Q6UhlZtCSR/iVDkCUz2tbEFlZ6DxWLPrsIeoN5V3fGsVZhb5h7NosuX4bYGfV8yp
 6Bk2pfapdKSaIW2S/jmiePYa9w8z2FlNqAdlq9u58zeGX9kyj9uJmuvLbM5ki/tdPaYj
 IpfQ5H5Qa+eanChAuaZz6n7luRN7oqavUgBhvAywNx05XY5DN7/qV7eWy4z3LLX6Lztq
 l4oQ==
X-Gm-Message-State: AO0yUKXo8Uuwrs5yVY3k69v8JY7zigeRhVVjqmmB+xqgqsD9Z0ammMap
 TMgA/d4qGvUJ2O/YN5GcYazaL9J+98TOD4IqM8x3Qgpsj8+DuuCJaKSVwWA9QDomJod6J3k2egU
 NEhvYoOss2Dda6H4=
X-Received: by 2002:adf:f750:0:b0:2c5:5938:e6d6 with SMTP id
 z16-20020adff750000000b002c55938e6d6mr10943625wrp.35.1678219163410; 
 Tue, 07 Mar 2023 11:59:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+GY7Rdcnx9lDOxhtEvp+kJaw5aR6OHiXB3NNECYHW/jfdFAvCqi3vF12Y2ARfYlaow/zTElQ==
X-Received: by 2002:adf:f750:0:b0:2c5:5938:e6d6 with SMTP id
 z16-20020adff750000000b002c55938e6d6mr10943618wrp.35.1678219163169; 
 Tue, 07 Mar 2023 11:59:23 -0800 (PST)
Received: from [192.168.8.107] (tmo-064-167.customers.d1-online.com.
 [80.187.64.167]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm13703682wrw.116.2023.03.07.11.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 11:59:22 -0800 (PST)
Message-ID: <d1819141-11f8-2f31-9f74-470e3fd7ecc6@redhat.com>
Date: Tue, 7 Mar 2023 20:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: How to unsubscribe
Content-Language: en-US
To: grace funmilola <oluwafunhmi@gmail.com>, qemu-devel@nongnu.org
References: <CAOB_jwgeB4NB1Gw+Abu4ZoV7UdoHd+XiT=aJpr4OLKG9Uq0woA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAOB_jwgeB4NB1Gw+Abu4ZoV7UdoHd+XiT=aJpr4OLKG9Uq0woA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 20.45, grace funmilola wrote:
> I would like to unsubscribe to the list pls

You can do that here:

  https://lists.gnu.org/mailman/listinfo/qemu-devel

  HTH,
   Thomas



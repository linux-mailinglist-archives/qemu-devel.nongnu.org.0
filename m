Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA7A53B5CE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 11:15:16 +0200 (CEST)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwgvC-00060v-VH
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 05:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwgoN-00047r-8u
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwgoH-0005QX-5b
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654160883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JX6mHS9bHCQIWvom3xnkWPf42mn206JM++uNVWrVCS4=;
 b=RL6e7mrqRuf9N0h15kDdW5p1FrVPGnfacpcvKxTW8CRy6ukMUjqSY2/atwOQMgnSyfVYU0
 0fvQi7Iavxn+87PC6I4wEOy88Bo6tYBP8RU6zovZBCUBtSc+h8x3DSQs3dYeczuPVDAvS8
 ZJO6wXgZHAGqUzdVVFL7Zd/X5tVbG00=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-icn3LY5aN3-W5DqSHYlAKw-1; Thu, 02 Jun 2022 05:08:02 -0400
X-MC-Unique: icn3LY5aN3-W5DqSHYlAKw-1
Received: by mail-wr1-f71.google.com with SMTP id
 bv12-20020a0560001f0c00b0020e359b3852so640991wrb.14
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 02:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=JX6mHS9bHCQIWvom3xnkWPf42mn206JM++uNVWrVCS4=;
 b=N51zn5nhD5YPnUQy+2PsNaiCm0FnQX32Zg0xutgBH5WJK7VSa39bD2/EFCCWqfCP/W
 /xBXiHRNypTz2JusALE51+7YBEPzzlj7pp9aTs6X6ubDtTJT4s28Qs2R/I2oj7PvC181
 UGDFbjC75QK6TOAp+8dBiGHrGMY8ogeq4X03pzGgFSX5TMWlhLJwmlOwcDVveBMhusjE
 nbX9yfzGiNSOOjQSPI7akX2VvJ8sioa+7V7jWlpo/YWqWP5i7jG2Y6ScbbMZwlb7xqTm
 yvpl457MTLbkKcrJbFBW16P6dRGjL9Jmu2duRnRbWqkZkdrXnhvH9k0+B5IMCtAXPnFO
 G+Kw==
X-Gm-Message-State: AOAM532oFPlQfBIj2mgBeAFypJEENwyhhXE0FCQRI/nCJXo5aWRDM/FG
 OyVIfVwIRrKPzA2OD/zoobI9mShTfr3ittLBPOr2DOuOzAQcz1LnN5NioMyOjlzVTp2Vd6tg4R8
 kwiPDl/PcsAPx7Rf51OuX3YBeKUvSfBPVe7Iuw52YNESWbgky6BBVyA+zmacjCpo=
X-Received: by 2002:adf:f5ca:0:b0:211:8d24:8277 with SMTP id
 k10-20020adff5ca000000b002118d248277mr2760737wrp.404.1654160881192; 
 Thu, 02 Jun 2022 02:08:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoO8UJa5GxInl7tFn3jiad5f9fMnEozO8oouNT4I9mOdH1u/JGl4PnHgCgv2eHSbCY9K5N8Q==
X-Received: by 2002:adf:f5ca:0:b0:211:8d24:8277 with SMTP id
 k10-20020adff5ca000000b002118d248277mr2760642wrp.404.1654160880847; 
 Thu, 02 Jun 2022 02:08:00 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-51.web.vodafone.de.
 [109.43.179.51]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b00397402ae674sm9025376wmg.11.2022.06.02.02.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 02:08:00 -0700 (PDT)
Message-ID: <2f587382-a77d-740a-b7b7-08d6bf5a5884@redhat.com>
Date: Thu, 2 Jun 2022 11:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Please update your QEMU branches to master if using gitlab.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi all,

just a reminder: Please note that gitlab.com introduced limits on the 
available CI minutes since yesterday [1]. So if you are using gitlab for 
storing your QEMU branches, please make sure that you update your branches 
to the very latest version of the qemu-project's master branch - this now 
contains some patches that prevent the CI from running by default when 
pushing branches to gitlab, so you should not accidentally run out of CI 
minutes anymore. For details, please refer to [2].

  HTH,
   Thomas



[1] https://about.gitlab.com/blog/2021/11/11/public-project-minute-limits/

[2] https://gitlab.com/qemu-project/qemu/-/commit/28357dc525b4798



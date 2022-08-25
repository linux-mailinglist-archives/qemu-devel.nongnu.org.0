Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA075A0F17
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:32:03 +0200 (CEST)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRB5e-0004Vg-7W
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRB19-0008Tf-9w
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:27:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRB16-0004Uj-R9
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661426839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lfn/OrEZ026EAilJPdzEpJG06PbgMHJGNe/tUBFlHA=;
 b=VBTt/t+mAp8K7vMaI6aJVpHKErMXakv2FSymSE9qDaaRtrQQXGv1wHZBfSAdo+TUJbU+HY
 yZD0pgUXPecGbGLe8CHVgsQ8K9AxYSQZD0+gfoMwLQe/Vs4kqklqD2arHwoPCRu9tNGW35
 LKZgOKXnX0P3DNi/4YYKjMhBuJTqbdk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-ih8fRdtfOAWUkJSBcTrc3g-1; Thu, 25 Aug 2022 07:27:18 -0400
X-MC-Unique: ih8fRdtfOAWUkJSBcTrc3g-1
Received: by mail-wr1-f71.google.com with SMTP id
 o3-20020adfa103000000b0022514e8e99bso3302035wro.19
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 04:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7lfn/OrEZ026EAilJPdzEpJG06PbgMHJGNe/tUBFlHA=;
 b=g6xEIpAZ1naciKrfF0LzzTLndU8wyh1mDVayNoRIkOOV0aAhz7xVbd7qWbxNRKD/Oh
 CI5YzUi/n37HJfJA/mLOz2aTveE8LuRgfOHLqhsbwB4WhNuQG+vdw6uMtwNjuw00WKFl
 lMNZtRCbxHRjoFeuPKsRxbKLb6JCoEcGHJJHcIFruIcwRofR4OVM0nRmcRPGOsetAgAE
 DYck1kXKF7ds/hvQNduZVIYKW+GeD634iX63PnUN3kpFRBG134rVeg1MjDhU6RDAGFDs
 lOWMyzVUdLsvqhORKZaS0HIVBgxFGnRM8eD5mLZnVipnFsx6ydhUdxYbulXwk3OOjsau
 ZaDw==
X-Gm-Message-State: ACgBeo2xYbqz86RtSe44Hzf5tRH44hkHgJAiGrFGZQZDdhoM06ZdHWLD
 +8nbjOdyrFblYy2fR/Bfjj1CW4+Mc8OezLVGDRNFoumgw5SjVggtijtLAltiLyhtgihWs+V1erq
 GdKIAc5WXgsS0ny4=
X-Received: by 2002:a1c:2705:0:b0:3a6:78b0:9545 with SMTP id
 n5-20020a1c2705000000b003a678b09545mr1993275wmn.165.1661426837378; 
 Thu, 25 Aug 2022 04:27:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4bTGFN68mQ9NT84ycNFama2ZgFfKl3gsgq57goJ2VsF9sTs99o9Yzddg4ySrbOgx9xGWjGIA==
X-Received: by 2002:a1c:2705:0:b0:3a6:78b0:9545 with SMTP id
 n5-20020a1c2705000000b003a678b09545mr1993256wmn.165.1661426837157; 
 Thu, 25 Aug 2022 04:27:17 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 cc19-20020a5d5c13000000b0022571d43d32sm4494096wrb.21.2022.08.25.04.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:27:16 -0700 (PDT)
Message-ID: <b1d8bed2-f28a-7d45-9264-f1636c7ff04b@redhat.com>
Date: Thu, 25 Aug 2022 13:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 17/51] tests/qtest: Build virtio-net-test for posix only
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-18-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-18-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> All of the virtio-net-test test cases require socketpair() to do the
> test setup.

I think that is not true. Look at the end of the file, after the comment 
"These tests do not need a loopback backend" ... these tests are using 
virtio_net_test_setup_nosocket which does not need socketpair().

You likely have to put the #ifdefs in different locations here instead.

  Thomas



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5514043E42C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:48:01 +0200 (CEST)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6hE-0002Y0-Do
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6dy-0001Ea-Ax
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:44:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6dv-0000ws-CG
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635432273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTOwNt/4FB4rCxzCB+80vEdbHuCPuWHjmZNkQPLTj/k=;
 b=Um6kisuQxYZxJ+duEhJTNxjELGgkeIRtHefK2uvr1z500bOd8aAsofqelsFWVCJtFFpYws
 ZMt43q5pKIYa8xp9zx8Hl198Qye2aZT17ecBwm1zag8TG5QZotD+vOWzKNV5qeWJNOb2II
 cp57qEPKo4ja0Xz/+42xqeW8ZnLXBjc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-f93cb5DCMCeUt7JJsznHBQ-1; Thu, 28 Oct 2021 10:44:32 -0400
X-MC-Unique: f93cb5DCMCeUt7JJsznHBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so2482777wmc.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wTOwNt/4FB4rCxzCB+80vEdbHuCPuWHjmZNkQPLTj/k=;
 b=4iRUOqWpplFBaEzLndrbL4CjhuoHVIOXPP8vqIS4ozBoxCsTuZxG3eBGbQ4s4hLih5
 WaHuL5cqhUlf3MPsRsukEk8bJGuift6Rfp/HotRfx1C43JiBWpTni00d2PhQtnUjg85F
 69JYPQne1bNHrL5/yalprG2L5l4APLSlX6FL7nRA+7n9tQN/w3TJTNL757Khun/aX770
 8lwlKrvvv10ClzhlwIYy/ULH0nYFzvR0F+rbMqnBQIgVhG9+QqWIcE/3OH/jgzwPQ4gW
 h5w67S8KwhiBTTtKsvH82DBdPPPF7Ghjissu1rYZO+ZTE2B/AmQRejnSqZIJrC/yqqzl
 K07A==
X-Gm-Message-State: AOAM533M0mHjIDYzcGG5UYGM2KtrpEBcEsBpLYBrpuhGHYFcGhnuSvpQ
 g+M0nQ4AXUJiykUsQ5WW+r0gg6KkAAqeEenz6JacIstVRtp6xsvnkjbDwHLNKmDJDD+K/pWucGr
 uUB79QKoS1yz/Wq8=
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr12577605wmq.168.1635432271000; 
 Thu, 28 Oct 2021 07:44:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZxYWuUsBIJ/zETwDJCE2fOQXSZGXmED31r0ffEvJFfy+SO56DVn9C8FN6+64/CijuD6qnzg==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr12577581wmq.168.1635432270820; 
 Thu, 28 Oct 2021 07:44:30 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n7sm3242807wra.37.2021.10.28.07.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 07:44:30 -0700 (PDT)
Message-ID: <91def190-d563-e463-7915-525d67631194@redhat.com>
Date: Thu, 28 Oct 2021 16:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/2] hw/core/machine: Add an unit test for smp_parse
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211026034659.22040-1-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026034659.22040-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 05:46, Yanan Wang wrote:
> Hi,
> 
> This is v3 which introduces an unit test for generic smp_parse.
> 
> We have had enough discussions about what kind of SMP configurations
> by the user should be considered valid and what should be invalid.
> Since we have finished optimizing the SMP parsing code, then this
> test normatively listed all the possible valid/invalid configurations
> that the user can provide. This can be a testing tool when we
> introduce new topology members and need to touch the parsing code.
> 
> For your reference, some related discussion is here:
> https://lore.kernel.org/qemu-devel/YOxf+sxzUSJdbY+j@redhat.com/
> 
> Changelog:
> v2->v3:
> - add Andrew's R-b for PATCH #1
> - drop an unused macro definition in PATCH #2
> - v2: https://lore.kernel.org/qemu-devel/20211013074119.23028-1-wangyanan55@huawei.com/
> 
> v1->v2:
> - split smp_parse out into a separate .c file instead of a header (patch #1)
> - dropped an unnecessary function and add Andrew's R-b (patch #2)
> - v1: https://lore.kernel.org/qemu-devel/20211010103954.20644-1-wangyanan55@huawei.com/
> 
> Yanan Wang (2):
>   hw/core/machine: Split out the smp parsing code
>   tests/unit: Add an unit test for smp parsing

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>




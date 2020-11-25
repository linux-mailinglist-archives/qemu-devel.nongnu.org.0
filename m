Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D62C3A89
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 09:10:38 +0100 (CET)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khpsp-0001Jp-Td
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 03:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khprU-0000mw-HH
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khprS-0008UG-6d
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606291749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rOsPqSrKUdLqpQy8HLSB5wW/4lC76C8SqPNVifRbKdE=;
 b=Ku3daO1Yxyk5ZD43HaiAqxBM2eZTcJxOtrd4hGX0cMqEmXLZ1kdwlVqyJrGW/rdIY/z6kC
 MSPCV0Vos69hq8+sQkmZv+4j/Uv6UYjh+xvLmVNVUWl373otdzp86E+CY42LOjnW/qeHHl
 mizRUkiLLq34dD2GLoDtPGspMBapStg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-8yO2pe6ZN8qxRmxpzo1Bfw-1; Wed, 25 Nov 2020 03:09:07 -0500
X-MC-Unique: 8yO2pe6ZN8qxRmxpzo1Bfw-1
Received: by mail-wm1-f69.google.com with SMTP id o19so483740wme.2
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 00:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rOsPqSrKUdLqpQy8HLSB5wW/4lC76C8SqPNVifRbKdE=;
 b=tJyYgNB4qZ9S58JpfXTRna/tgDR2T8/8ylkc1iIDNN+rF3rHahGD0z/RQZfcfj/+u6
 RaCWkxlxE0i3zdQxyyzktC9R9C7J10lQE4E5NMVzgOv2fV+k4rI3S59Gaw7CP7K2+oT2
 hpZAzwOg0Uza1gu6kHuBRAbHYQ9fXo7N/H/UMEZ6kWf/fhzgMUk+XL40paoqZboqJ9SR
 G6aQdtAC/3aNIGK3X3j1tYVDpM3bgJFZ8xJFdLu9Yee0UXaA9Z4KZBAnQa9fW1KDo0V7
 JKarlL741QCcAusK755gjEzLWgssXA8I067AoIdQBRjrYmsh1PWfK5icW6/qPAkDxoNS
 oGgw==
X-Gm-Message-State: AOAM530VxzYNQDMeHKHQ+FQI7X5Ch1il6TAk5f0vAhUsJMWg+zWqhIAN
 iCifmPOB8Hbd5B5Njhi+jDwLPM1aLWpeDmGM04VUeBO91QFL7xjfh+Vq4+GMhAPslsu+GOyDVVL
 g4DbbXD026IDEr2++MC5fzl9AVDf5m1frVru2wx7MkIniVZ3imf0a3WDrqRfZvp5j
X-Received: by 2002:adf:e611:: with SMTP id p17mr2568524wrm.180.1606291745931; 
 Wed, 25 Nov 2020 00:09:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5Rhk+J+UJWSgvADCSkBpv0gd+pMxcdDperh7WEevWj6NsWtqhzMiaABe6W+9alOGni66e3Q==
X-Received: by 2002:adf:e611:: with SMTP id p17mr2568504wrm.180.1606291745699; 
 Wed, 25 Nov 2020 00:09:05 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b145sm3522574wmd.0.2020.11.25.00.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 00:09:05 -0800 (PST)
Subject: Re: [PATCH 3/3] monitor:Don't use '#' flag of printf format ('%#') in
 format strings
To: Yutao Ai <aiyutao@huawei.com>, dgilbert@redhat.com, armbru@redhat.com
References: <20201125014514.55562-1-aiyutao@huawei.com>
 <20201125014514.55562-4-aiyutao@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c38e5496-821c-5e82-91ec-6ec7a095c934@redhat.com>
Date: Wed, 25 Nov 2020 09:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125014514.55562-4-aiyutao@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/20 2:45 AM, Yutao Ai wrote:
> Delete '#' and use '0x' prefix instead
> 
> Signed-off-by: Yutao Ai <aiyutao@huawei.com>
> ---
>  monitor/misc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



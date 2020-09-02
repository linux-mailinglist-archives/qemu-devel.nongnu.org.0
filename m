Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66AC25A7DA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 10:36:40 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDOFz-0002w7-Ip
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 04:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDOFD-0002UE-SO
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:35:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30927
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDOFB-0005fz-Ri
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599035748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGMcrCPeCiEnOae9fdaA/uWRmLz5u25i0KePLaAR9QA=;
 b=RwnHDdar4S6YelcXH/Vr6tCO/NKV9lPSt4EjZnO5tZAehBC6xuv77V1pWChhffyrF0cMVm
 ZvEwmuF0oI6DDXZUohzUCB6DndDWO90hFbT0rEFOP73UF1peKTiaw3LP9G53yYxVM/2CQa
 /1SXuQozePjq+kEmoq67WVE523kCVMI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-F0Fd7WQ6P5WMmEqVk2zpfw-1; Wed, 02 Sep 2020 04:35:46 -0400
X-MC-Unique: F0Fd7WQ6P5WMmEqVk2zpfw-1
Received: by mail-wr1-f72.google.com with SMTP id k11so1671638wrw.16
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 01:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TGMcrCPeCiEnOae9fdaA/uWRmLz5u25i0KePLaAR9QA=;
 b=t+/ESuAe+eAkO0hkQcDGfe7Px1a/rNUDR3eecIk+gAYnXRul4La82CXErX/g6Tnp7S
 pZYd6Xp07NEjv7dDuU/gG8hXlLtPhlX9lgcAJriZaf2/x68KsM8hW9MJ+k0/uCfvmxZn
 T/Ry8FZ8bIqvXDrQZWQoxH4QetxP9Tau9o7k/VY2IRLC4aV6PJRNA84OKRbq4kjvieiZ
 WkwnboY5GAB2H0li2coqKpzR7WyQZ2S1eLzw845AHe++BytB8xwI5dWQshRdcMZhe9gi
 LbrCFAbbT97q1YhVgNxCq0LiaBQsRe8I9LY4W9p80ThQK/pGEtw0r4Jb3wVuVBo0Bhkj
 tSRw==
X-Gm-Message-State: AOAM532g/TLOs2rm0Y69QMF5FLJu1QUk45murq37ilnY7AsH3wYy3qbh
 fHlK4jXC93LsI3ezzmW3N41zxo+60eHUENSDMAfvOU2Z7CPKX8iB00hYd8T1FuPRR656Rq14NO0
 ZmmUZBgL9WiaraYI=
X-Received: by 2002:a5d:6852:: with SMTP id o18mr5896099wrw.113.1599035745367; 
 Wed, 02 Sep 2020 01:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPZ/a9PLBZqeE+/U3dtjVVSakFr/8MEgNdR2oeARrFoOzffLKW9sNivTSCMmNbJtaC4yZAkA==
X-Received: by 2002:a5d:6852:: with SMTP id o18mr5896073wrw.113.1599035745090; 
 Wed, 02 Sep 2020 01:35:45 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.173.193])
 by smtp.gmail.com with ESMTPSA id h5sm6137785wrt.31.2020.09.02.01.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 01:35:44 -0700 (PDT)
Subject: Re: [PATCH 08/13] vl: relocate paths to data directories
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200901062020.26660-1-pbonzini@redhat.com>
 <20200901062020.26660-9-pbonzini@redhat.com>
 <daeab859-fb07-fbb1-1b7d-79ed75578f2c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <03017cc5-8a42-5834-8b5d-263e6f1322dc@redhat.com>
Date: Wed, 2 Sep 2020 10:35:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <daeab859-fb07-fbb1-1b7d-79ed75578f2c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:26:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/20 10:28, Philippe Mathieu-Daudé wrote:
>>  
>> -void qemu_add_data_dir(const char *path)
>> +void qemu_add_data_dir(char *path)
> But we have 'const char *data_dir[16];', why remove the const?

In order to free duplicates: before this patch the directory can be
statically- or stack-allocated, now it's always heap-allocated.

Paolo

>  {
>      int i;
>  
> @@ -2017,10 +2017,11 @@ void qemu_add_data_dir(const char *path)
>      }
>      for (i = 0; i < data_dir_idx; i++) {
>          if (strcmp(data_dir[i], path) == 0) {
> -            return; /* duplicate */
> +            g_free(path); /* duplicate */
> +            return;
>          }
>      }
> -    data_dir[data_dir_idx++] = g_strdup(path);
> +    data_dir[data_dir_idx++] = path;
>  }

Paolo



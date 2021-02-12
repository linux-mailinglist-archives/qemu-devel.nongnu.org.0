Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3931A0A3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:34:05 +0100 (CET)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZWG-00053a-Sk
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAZVB-0004bv-Jh
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:32:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAZV8-0006t8-Rg
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613140373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0y5jdgGD0yyPL1xyOao3r1aPYsdgxQlkTSommMRR9tc=;
 b=VB3cTgYfD1j8tz8PDEDLHIqXpObysF1HXxekGqU4kXCNaQ+oJczBbzXofdS8CM89FGYBUK
 JrwXTDOolGu5W+PAy5OK+0JJeO9wKMB7UgPyGcrlUgSLw1qwvbw/lx+d2n1O0EKvOwxgIE
 vJQDoHQ5VEVLkbyptmpROM9vCVEIUyA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-uFUzsZBCPgKB1Q4xOGDssg-1; Fri, 12 Feb 2021 09:32:50 -0500
X-MC-Unique: uFUzsZBCPgKB1Q4xOGDssg-1
Received: by mail-wr1-f69.google.com with SMTP id p11so1175060wrm.13
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 06:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0y5jdgGD0yyPL1xyOao3r1aPYsdgxQlkTSommMRR9tc=;
 b=bx0D+WyIs3+i1OeQaIwQNaiQjtt8N21Az7X30007H2p6xRjwIeR12t9s05ZtigNOQ7
 u6SXQypKEKEaAYAjzI33ysaGIO69ihKVOB5KQItKYF9yfpN9u0TTuXDWD2GYa3MZr9WR
 E6OQYcXvZ1RM3fY0bGiVEmrDj9x2puE3RphftvTOl00riFQKesLWUvBGMQ1IHjDuoE3W
 nhSOqlxySlSInhM0QyZCW/rYsmue10OcDYZROAVY71sM8MkAMH82hyV5QZR57HZaKpcp
 AHpZbfa2bsTiSo6Jjan6iFqLroGb7jRq7WGFBCPa9HogsHoiiM7Lcbk3ptxpIMICRMon
 QjxQ==
X-Gm-Message-State: AOAM531sbY3ESUnrCFrayFkoQMB4fvvANEMUfuDYXoI7YJqCSrQU7MF0
 D7YniagmXgJbyPtpEGpkyRKq9WebGToprwyvFgpsJJP8xsG9hV03Ct6ku4eL7cJftu6sW7kFXZt
 0VeZUo2C5bjYfVpM=
X-Received: by 2002:a5d:680e:: with SMTP id w14mr1080975wru.322.1613140369614; 
 Fri, 12 Feb 2021 06:32:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIUKDAvZGF0EaipFmYl09S+rgc98Xr/pzWRJPa1+K+TiFl7uprMGpXYY9dWe72jZnynF8OwQ==
X-Received: by 2002:a5d:680e:: with SMTP id w14mr1080927wru.322.1613140369208; 
 Fri, 12 Feb 2021 06:32:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z6sm14004844wmi.39.2021.02.12.06.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 06:32:48 -0800 (PST)
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default with
 'null-co' driver
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210211154228.izwdqb33dxtnu65n@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2792857c-403a-c3f0-9635-e3b973347dd9@redhat.com>
Date: Fri, 12 Feb 2021 15:32:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211154228.izwdqb33dxtnu65n@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 4:42 PM, Alexander Bulekov wrote:
> On 210211 1526, Philippe Mathieu-Daudé wrote:
>> The null-co driver doesn't zeroize buffer in its default config,
>> because it is designed for testing and tests want to run fast.
>> However this confuses security researchers (access to uninit
>> buffers).
>>
> 
> Interesting.. Is there an example bug report, where it raised alarms
> because of an un-zeroed null-co:// buffer?

No, but I found a similar mention here:
https://www.mail-archive.com/qemu-block@nongnu.org/msg52045.html

Example:

$ valgrind qemu-system-i386 -S -drive
file=null-co://,format=raw,file.read-zeroes=on

$ valgrind qemu-system-i386 -S -drive
file=null-co://,format=raw,file.read-zeroes=off
==4048219== Conditional jump or move depends on uninitialised value(s)
==4048219==    at 0x4E19CC: guess_disk_lchs (hd-geometry.c:70)
==4048219==    by 0x4E1C72: hd_geometry_guess (hd-geometry.c:131)
==4048219==    by 0x4E0F0F: blkconf_geometry (block.c:183)
==4048219==    by 0x563727: ide_dev_initfn (qdev.c:201)
==4048219==    by 0x563AE4: ide_hd_realize (qdev.c:278)
==4048219==    by 0x563320: ide_qdev_realize (qdev.c:124)
==4048219==    by 0x8F8EAA: device_set_realized (qdev.c:761)
==4048219==    by 0x902347: property_set_bool (object.c:2255)
==4048219==    by 0x900441: object_property_set (object.c:1400)
==4048219==    by 0x904467: object_property_set_qobject (qom-qobject.c:28)
==4048219==    by 0x9007A4: object_property_set_bool (object.c:1470)
==4048219==    by 0x8F7F3B: qdev_realize (qdev.c:389)



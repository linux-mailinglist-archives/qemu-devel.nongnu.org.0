Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951C7447B87
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:06:58 +0100 (CET)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzg9-00061w-PI
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:06:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzYv-0007ht-91
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzYs-0000T8-Iq
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636358364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuWmdinz0tIzaD99NqIdLj9ATqm00lk4XzsqYjlALpc=;
 b=N2eNJsTbSWBRa6oeKHPKPP+1gd3pwhVDfb56CWCfPFI95zjvUamXSQyIkq7444YOT7iDgQ
 XP7IKXzRDverz0Di3akiNw08dym5pZzAwPAtBRpoSIKcglQ0jeBzpBwujDp7I3WSrSzKOG
 pJMhfMRMenll4uxKGwSFWZiY2hhf4jo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-TTo_kmDdMBy6rjlMtVKh2w-1; Mon, 08 Nov 2021 02:59:22 -0500
X-MC-Unique: TTo_kmDdMBy6rjlMtVKh2w-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so5406271wms.8
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 23:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nuWmdinz0tIzaD99NqIdLj9ATqm00lk4XzsqYjlALpc=;
 b=Zx0ekOZRkoDcj4KKSUrz054f08GKMQCXg7Y8/K9EBWmb6rXXietp6x71qup4J7EmfQ
 Nh5WMK7SjgVgr/Bc2J7LVA8lFgOtc/9oxMclsAPIbtvgHveQvTrfgBE0J4cceIi1h/xF
 8lTeuRETkSWGlfHV3emahIUCsPcYxaLifLKv3ApXApMxJjLEVJkFYL9vcFVrVCL3OOlq
 J60G4AE7XOTKb8RfmqsOFXeLsEPnLRtEvB9AwZg00MNCkrpJuhEME4AmVhCP5ZmK1GBw
 yzFZwJvSgwvZwdRcYytI3GPZfIUvUOEbiSt95ekbGg7S4DmkcRBieCq0xkQM1ySvMZ6/
 WsfA==
X-Gm-Message-State: AOAM532QLdDbqng3XSOUE/uzOOlGIyPF0/S8V3/Lc1zxISfwee4EiwNu
 kOutWdayUDdnzvPu7OHji1MBfkNhbAgRg78dcgX50P4rCDrEViZH/t/BX3s2gCZQKduBb86h+ZB
 rw6HgxM1vA0fO1cY=
X-Received: by 2002:a5d:4143:: with SMTP id c3mr79474599wrq.254.1636358361404; 
 Sun, 07 Nov 2021 23:59:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxz9samiAfDIC73C9KsVPi4M7/420q5LqyYeDSi1+Uitt52mcytQCa2DeC/Bs+KMggXzXNeHQ==
X-Received: by 2002:a5d:4143:: with SMTP id c3mr79474569wrq.254.1636358361263; 
 Sun, 07 Nov 2021 23:59:21 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t189sm15284995wma.8.2021.11.07.23.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:59:20 -0800 (PST)
Message-ID: <17c45808-5c04-146b-393b-74d5bd472726@redhat.com>
Date: Mon, 8 Nov 2021 08:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/2] tests/acceptance: rename tests acceptance to tests
 avocado
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20211105155354.154864-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211105155354.154864-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>, Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 16:53, Willian Rampazzo wrote:
> In the discussion about renaming the `tests/acceptance` [1], the
> conclusion was that the folders inside `tests` are related to the
> framework running the tests and not directly related to the type of
> the tests.
> 
> This changes the folder to `tests/avocado` and adjusts the MAKEFILE, the
> CI related files and the documentation.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html
> 
> GitLab pipeline with new naming: https://gitlab.com/willianrampazzo/qemu/-/pipelines/403056475
> 
> Changes from v1:
>  - Split changes on Makefile leaving `check-acceptance` available and
>    adding a deprecate warning message when it is used.
>    (Suggested-by: Philippe Mathieu-Daudé)
>  - Remove unrelated changes.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> 
> Willian Rampazzo (2):
>   tests/acceptance: introduce new check-avocado tartget
>   tests/acceptance: rename tests acceptance to tests avocado

Thanks, series queued.



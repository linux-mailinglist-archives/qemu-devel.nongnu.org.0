Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2595323B5E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:39:36 +0100 (CET)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsVz-0002zv-VU
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEsUb-0002X6-SE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEsUW-0005cq-Ae
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614166683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G65pnobmk8B3RJhFQK2VV/vlabUrpI+z0rRef6dAFOs=;
 b=Wib+kUkvtbm+sWpbHk09R5M18Vyg2Z14uva2k0Nn5uNstsGbJYny6urtJYDZxP55e4gqwR
 REjm849s3CnF9TBugQGKFqTIQ0K48BXvBHkWYzcMhYidISkZZkj0yE/x78okL4EDcGCxKv
 5GOjETi8RELal2vNsivo3R0l0Yz/gfE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-aKHp6H0EOR2orj2WYfpsjA-1; Wed, 24 Feb 2021 06:37:57 -0500
X-MC-Unique: aKHp6H0EOR2orj2WYfpsjA-1
Received: by mail-wm1-f69.google.com with SMTP id b62so441561wmc.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G65pnobmk8B3RJhFQK2VV/vlabUrpI+z0rRef6dAFOs=;
 b=FlekHTS9QqfnzPrKR3HC+OF7g0evP6m4ilmD6AIHIQq4XbjFG/xfTbDQ6wog1OaX2b
 L3fCKTzFa0MCxEd9YSXEd5i75s+xqmo7tLr+hwQhiOX+eJiH98XHiq7oN1vR231EWsS6
 c7Awr29QH0WPA8Sovt49S+YMHYYchftVLfh0h/WmIGY2quia0j4GpUxrbiNVhNsLe+rk
 hrj2pg1uY1HhXNgfG2iAvozYTRJS3hMYJBaW1Wyuci1kLAxwgjSlWgrNeklId4/Y9kOG
 G+g1Kz+dVmatf5DGV1Uvv4z3H8/X60JyqFoSrMDn68qvsE1BAIYKpjKvJdGoauvG+5VT
 6nJQ==
X-Gm-Message-State: AOAM53265BY1b+MD3WpGy6e1CLvH5upjCyTzQkNeUlypiOF0x/JQUKOS
 /V/s3AsMxf7efRkheaqdzBqda5zCYzGkXm+gQz7L+G/S06FP6pNJgsYACxsaTXaTcqppGPK9eDF
 PTk915BglKMQJI/8=
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr22987920wrx.3.1614166675564; 
 Wed, 24 Feb 2021 03:37:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVARvmjGP/dWO2CSGL5pDeK1GW6mpG2olv/rO4RSK7X0NHAUgfSm7e8L7q4wXUxBgxpwzYCA==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr22987903wrx.3.1614166675395; 
 Wed, 24 Feb 2021 03:37:55 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v5sm2398641wmh.2.2021.02.24.03.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 03:37:54 -0800 (PST)
Subject: Re: Problem running functional tests from China
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
 <20210224110605.GM6564@kitsune.suse.cz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <198ecefe-4d68-b43d-dfae-8a5ceeee9615@redhat.com>
Date: Wed, 24 Feb 2021 12:37:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224110605.GM6564@kitsune.suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, avocado-devel <avocado-devel@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 12:06 PM, Michal Suchánek wrote:
> On Wed, Feb 24, 2021 at 10:29:15AM +0100, Philippe Mathieu-Daudé wrote:
>> Just to inform the files hosted on github don't work when
>> testing from China:
> 
>>
>> raw.githubusercontent.com resolves to 127.0.0.1

Actually not even localhost but 0.0.0.0 :)

> And from where does this come from?
> 
> Your local system, your ISP, ... ?

Probably the ISP:

$ host -v raw.githubusercontent.com
Trying "raw.githubusercontent.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 21011
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;raw.githubusercontent.com.     IN      A

;; ANSWER SECTION:
raw.githubusercontent.com. 299  IN      A       0.0.0.0

Received 59 bytes from 210.22.70.3#53 in 3 ms
Trying "raw.githubusercontent.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 60262
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;raw.githubusercontent.com.     IN      AAAA

;; ANSWER SECTION:
raw.githubusercontent.com. 297  IN      AAAA    ::

Received 71 bytes from 210.22.70.3#53 in 3 ms
Trying "raw.githubusercontent.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 30016
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0

;; QUESTION SECTION:
;raw.githubusercontent.com.     IN      MX

;; AUTHORITY SECTION:
badlist.                350     IN      SOA     localhost.
root.locahost. 1 3600 900 2592000 7200

Received 108 bytes from 210.22.70.3#53 in 3 ms

I raised that problem not to find a way to bypass an ISP
firewall, but to see if there is a way to use another
storage for test artifacts so all the community can run
the tests.

Regards,

Phil.



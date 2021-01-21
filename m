Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA82FEE2D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:13:02 +0100 (CET)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2bdt-0000A9-Q0
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2ba5-0005qA-1Q
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2bZu-0006Dl-6H
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611241729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpDrL/Fya0wvdSNfCucuaf2BCQSLCQtC8KLEbfuHaxk=;
 b=AeVLGsRIm/QAiSbCLBpGh6zmeR5BDU4z1f67d19I5i4IG9LKdcjOE6RkWqCmDP5TMZgA7C
 51k15UDRyGMQwP14wlvgYpPj4EXqSpw/De/TktjxkxHOhmq85EZmiU2DK11zij2jT3TnCi
 FhxQwWkUwACy2eFyvmmRSgzpHiyOmLU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-jp3ffOcdO2G5mwFqovgvHw-1; Thu, 21 Jan 2021 10:08:46 -0500
X-MC-Unique: jp3ffOcdO2G5mwFqovgvHw-1
Received: by mail-ed1-f72.google.com with SMTP id n18so1307750eds.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpDrL/Fya0wvdSNfCucuaf2BCQSLCQtC8KLEbfuHaxk=;
 b=X0ztTgrvntVayYjdd7O558vTkXNqe0UJSc6YtZ7FA2o0UtLqoTygZ1xLrNtXYjHZ1b
 34Zf4cdIrmjZVmbk+f/Ek3Q9yAspb8nAiSO27WxfAE8fgXKY2diBgut1w8HMpSICdFup
 3AeSBZTGy8b/RCNp1H+tjbXwJASNi8HmC4cRuCG2J9CZjBvzR5sEbrUB3gpGR8kmFzFQ
 nLZ2vC1m4Ugv03LF9UWIpGziSb6Nv0AsQpqm2zsVbCx3G1ly7papBpn6bcoZiYXvve/6
 shYHYI8yH+Ki8huO9qinfEtZDRjks8kIfah3DBgkLlHvuoD2pw0aBDMEDpYcjZkhLBzB
 Ke2A==
X-Gm-Message-State: AOAM531B1vig63pkjetOQaJsQEmu0ghiL0wMdZX5/8BfoeswJ+1IUVmB
 HH891PHxSYOE70Kb4dHcms5HDx9CiCaJGtSSjfRS9S//RBRcnD0HZy5gg6WsxhoH4l33Fc42Wiq
 2bizZ7K2Big5JEEM=
X-Received: by 2002:aa7:d959:: with SMTP id l25mr11510899eds.55.1611241725207; 
 Thu, 21 Jan 2021 07:08:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ324MLSSns8pzoesVAi353VwLfUIq1lnJZQWunLCNM/1Ed9sYgYQKJ3ALfDL33G6zNnuUrw==
X-Received: by 2002:aa7:d959:: with SMTP id l25mr11510866eds.55.1611241724873; 
 Thu, 21 Jan 2021 07:08:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id k27sm2338792eje.67.2021.01.21.07.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:08:44 -0800 (PST)
Subject: Re: [PATCH v7 00/11] Rework iotests/check
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e40ad811-1f49-15fa-1bb8-c82876ee1094@redhat.com>
Date: Thu, 21 Jan 2021 16:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/01/21 14:44, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> These series has 3 goals:
> 
>   - get rid of group file (to forget about rebase and in-list conflicts)
>   - introduce human-readable names for tests
>   - rewrite check into python

Very nice!

I have wondered for some time if we should rewrite check as a wrapper 
around avocado.  Your effort certainly goes in the right direction, 
since it at least uses the same programming language and introduces 
abstractions that can be easily turned into avocado wrappers.

Paolo

> v7:
>    - fix wording and grammar
>    - satisfy python linters
>    - move argv interfaces all into one in new check script
>    - support '-n' == '--dry-run' option
>    - update check-block to run check with correct PYTHON
> 
>   findtests: - stop parsing test file after first '# group: ' line
>              - use parse_test_name in add_group_file()
>              - make new list instead of modifying parameter exclude_groups
> 
>   testenv: - fix machine_map
>            - fix self.python
> 
>   testrunner: use env.python to run python tests
> 
> Vladimir Sementsov-Ogievskiy (11):
>    iotests/277: use dot slash for nbd-fault-injector.py running
>    iotests/303: use dot slash for qcow2.py running
>    iotests: fix some whitespaces in test output files
>    iotests: make tests executable
>    iotests/294: add shebang line
>    iotests: define group in each iotest
>    iotests: add findtests.py
>    iotests: add testenv.py
>    iotests: add testrunner.py
>    iotests: rewrite check into python
>    iotests: rename and move 169 and 199 tests
> 
>   docs/devel/testing.rst                        |   50 +-
>   Makefile                                      |    1 -
>   tests/check-block.sh                          |    2 +-
>   tests/qemu-iotests/001                        |    1 +
>   tests/qemu-iotests/002                        |    1 +
>   tests/qemu-iotests/003                        |    1 +
>   tests/qemu-iotests/004                        |    1 +
>   tests/qemu-iotests/005                        |    1 +
>   tests/qemu-iotests/007                        |    1 +
>   tests/qemu-iotests/008                        |    1 +
>   tests/qemu-iotests/009                        |    1 +
>   tests/qemu-iotests/010                        |    1 +
>   tests/qemu-iotests/011                        |    1 +
>   tests/qemu-iotests/012                        |    1 +
>   tests/qemu-iotests/013                        |    1 +
>   tests/qemu-iotests/014                        |    1 +
>   tests/qemu-iotests/015                        |    1 +
>   tests/qemu-iotests/017                        |    1 +
>   tests/qemu-iotests/018                        |    1 +
>   tests/qemu-iotests/019                        |    1 +
>   tests/qemu-iotests/020                        |    1 +
>   tests/qemu-iotests/021                        |    1 +
>   tests/qemu-iotests/022                        |    1 +
>   tests/qemu-iotests/023                        |    1 +
>   tests/qemu-iotests/024                        |    1 +
>   tests/qemu-iotests/025                        |    1 +
>   tests/qemu-iotests/026                        |    1 +
>   tests/qemu-iotests/027                        |    1 +
>   tests/qemu-iotests/028                        |    1 +
>   tests/qemu-iotests/029                        |    1 +
>   tests/qemu-iotests/030                        |    1 +
>   tests/qemu-iotests/031                        |    1 +
>   tests/qemu-iotests/032                        |    1 +
>   tests/qemu-iotests/033                        |    1 +
>   tests/qemu-iotests/034                        |    1 +
>   tests/qemu-iotests/035                        |    1 +
>   tests/qemu-iotests/036                        |    1 +
>   tests/qemu-iotests/037                        |    1 +
>   tests/qemu-iotests/038                        |    1 +
>   tests/qemu-iotests/039                        |    1 +
>   tests/qemu-iotests/040                        |    1 +
>   tests/qemu-iotests/041                        |    1 +
>   tests/qemu-iotests/042                        |    1 +
>   tests/qemu-iotests/043                        |    1 +
>   tests/qemu-iotests/044                        |    1 +
>   tests/qemu-iotests/045                        |    1 +
>   tests/qemu-iotests/046                        |    1 +
>   tests/qemu-iotests/047                        |    1 +
>   tests/qemu-iotests/048                        |    1 +
>   tests/qemu-iotests/049                        |    1 +
>   tests/qemu-iotests/050                        |    1 +
>   tests/qemu-iotests/051                        |    1 +
>   tests/qemu-iotests/052                        |    1 +
>   tests/qemu-iotests/053                        |    1 +
>   tests/qemu-iotests/054                        |    1 +
>   tests/qemu-iotests/055                        |    1 +
>   tests/qemu-iotests/056                        |    1 +
>   tests/qemu-iotests/057                        |    1 +
>   tests/qemu-iotests/058                        |    1 +
>   tests/qemu-iotests/059                        |    1 +
>   tests/qemu-iotests/060                        |    1 +
>   tests/qemu-iotests/061                        |    1 +
>   tests/qemu-iotests/062                        |    1 +
>   tests/qemu-iotests/063                        |    1 +
>   tests/qemu-iotests/064                        |    1 +
>   tests/qemu-iotests/065                        |    1 +
>   tests/qemu-iotests/066                        |    1 +
>   tests/qemu-iotests/068                        |    1 +
>   tests/qemu-iotests/069                        |    1 +
>   tests/qemu-iotests/070                        |    1 +
>   tests/qemu-iotests/071                        |    1 +
>   tests/qemu-iotests/072                        |    1 +
>   tests/qemu-iotests/073                        |    1 +
>   tests/qemu-iotests/074                        |    1 +
>   tests/qemu-iotests/075                        |    1 +
>   tests/qemu-iotests/076                        |    1 +
>   tests/qemu-iotests/077                        |    1 +
>   tests/qemu-iotests/078                        |    1 +
>   tests/qemu-iotests/079                        |    1 +
>   tests/qemu-iotests/080                        |    1 +
>   tests/qemu-iotests/081                        |    1 +
>   tests/qemu-iotests/082                        |    1 +
>   tests/qemu-iotests/083                        |    1 +
>   tests/qemu-iotests/084                        |    1 +
>   tests/qemu-iotests/085                        |    1 +
>   tests/qemu-iotests/086                        |    1 +
>   tests/qemu-iotests/087                        |    1 +
>   tests/qemu-iotests/088                        |    1 +
>   tests/qemu-iotests/089                        |    1 +
>   tests/qemu-iotests/090                        |    1 +
>   tests/qemu-iotests/091                        |    1 +
>   tests/qemu-iotests/092                        |    1 +
>   tests/qemu-iotests/093                        |    1 +
>   tests/qemu-iotests/094                        |    1 +
>   tests/qemu-iotests/095                        |    1 +
>   tests/qemu-iotests/096                        |    1 +
>   tests/qemu-iotests/097                        |    1 +
>   tests/qemu-iotests/098                        |    1 +
>   tests/qemu-iotests/099                        |    1 +
>   tests/qemu-iotests/101                        |    1 +
>   tests/qemu-iotests/102                        |    1 +
>   tests/qemu-iotests/103                        |    1 +
>   tests/qemu-iotests/104                        |    1 +
>   tests/qemu-iotests/105                        |    1 +
>   tests/qemu-iotests/106                        |    1 +
>   tests/qemu-iotests/107                        |    1 +
>   tests/qemu-iotests/108                        |    1 +
>   tests/qemu-iotests/109                        |    1 +
>   tests/qemu-iotests/110                        |    1 +
>   tests/qemu-iotests/111                        |    1 +
>   tests/qemu-iotests/112                        |    1 +
>   tests/qemu-iotests/113                        |    1 +
>   tests/qemu-iotests/114                        |    1 +
>   tests/qemu-iotests/115                        |    1 +
>   tests/qemu-iotests/116                        |    1 +
>   tests/qemu-iotests/117                        |    1 +
>   tests/qemu-iotests/118                        |    1 +
>   tests/qemu-iotests/119                        |    1 +
>   tests/qemu-iotests/120                        |    1 +
>   tests/qemu-iotests/121                        |    1 +
>   tests/qemu-iotests/122                        |    1 +
>   tests/qemu-iotests/123                        |    1 +
>   tests/qemu-iotests/124                        |    1 +
>   tests/qemu-iotests/125                        |    1 +
>   tests/qemu-iotests/126                        |    1 +
>   tests/qemu-iotests/127                        |    1 +
>   tests/qemu-iotests/128                        |    1 +
>   tests/qemu-iotests/129                        |    1 +
>   tests/qemu-iotests/130                        |    1 +
>   tests/qemu-iotests/131                        |    1 +
>   tests/qemu-iotests/132                        |    1 +
>   tests/qemu-iotests/133                        |    1 +
>   tests/qemu-iotests/134                        |    1 +
>   tests/qemu-iotests/135                        |    1 +
>   tests/qemu-iotests/136                        |    1 +
>   tests/qemu-iotests/137                        |    1 +
>   tests/qemu-iotests/138                        |    1 +
>   tests/qemu-iotests/139                        |    1 +
>   tests/qemu-iotests/140                        |    1 +
>   tests/qemu-iotests/141                        |    1 +
>   tests/qemu-iotests/143                        |    1 +
>   tests/qemu-iotests/144                        |    1 +
>   tests/qemu-iotests/145                        |    1 +
>   tests/qemu-iotests/146                        |    1 +
>   tests/qemu-iotests/147                        |    1 +
>   tests/qemu-iotests/148                        |    1 +
>   tests/qemu-iotests/149                        |    1 +
>   tests/qemu-iotests/150                        |    1 +
>   tests/qemu-iotests/151                        |    1 +
>   tests/qemu-iotests/152                        |    1 +
>   tests/qemu-iotests/153                        |    1 +
>   tests/qemu-iotests/154                        |    1 +
>   tests/qemu-iotests/155                        |    1 +
>   tests/qemu-iotests/156                        |    1 +
>   tests/qemu-iotests/157                        |    1 +
>   tests/qemu-iotests/158                        |    1 +
>   tests/qemu-iotests/159                        |    1 +
>   tests/qemu-iotests/160                        |    1 +
>   tests/qemu-iotests/161                        |    1 +
>   tests/qemu-iotests/162                        |    1 +
>   tests/qemu-iotests/163                        |    1 +
>   tests/qemu-iotests/165                        |    1 +
>   tests/qemu-iotests/170                        |    1 +
>   tests/qemu-iotests/171                        |    1 +
>   tests/qemu-iotests/172                        |    1 +
>   tests/qemu-iotests/173                        |    1 +
>   tests/qemu-iotests/174                        |    1 +
>   tests/qemu-iotests/175                        |    1 +
>   tests/qemu-iotests/175.out                    |    2 +-
>   tests/qemu-iotests/176                        |    1 +
>   tests/qemu-iotests/177                        |    1 +
>   tests/qemu-iotests/178                        |    1 +
>   tests/qemu-iotests/179                        |    1 +
>   tests/qemu-iotests/181                        |    1 +
>   tests/qemu-iotests/182                        |    1 +
>   tests/qemu-iotests/183                        |    1 +
>   tests/qemu-iotests/184                        |    1 +
>   tests/qemu-iotests/185                        |    1 +
>   tests/qemu-iotests/186                        |    1 +
>   tests/qemu-iotests/187                        |    1 +
>   tests/qemu-iotests/188                        |    1 +
>   tests/qemu-iotests/189                        |    1 +
>   tests/qemu-iotests/190                        |    1 +
>   tests/qemu-iotests/191                        |    1 +
>   tests/qemu-iotests/192                        |    1 +
>   tests/qemu-iotests/194                        |    1 +
>   tests/qemu-iotests/195                        |    1 +
>   tests/qemu-iotests/196                        |    1 +
>   tests/qemu-iotests/197                        |    1 +
>   tests/qemu-iotests/198                        |    1 +
>   tests/qemu-iotests/200                        |    1 +
>   tests/qemu-iotests/201                        |    1 +
>   tests/qemu-iotests/202                        |    1 +
>   tests/qemu-iotests/203                        |    1 +
>   tests/qemu-iotests/204                        |    1 +
>   tests/qemu-iotests/205                        |    1 +
>   tests/qemu-iotests/206                        |    1 +
>   tests/qemu-iotests/207                        |    1 +
>   tests/qemu-iotests/208                        |    1 +
>   tests/qemu-iotests/209                        |    1 +
>   tests/qemu-iotests/210                        |    1 +
>   tests/qemu-iotests/211                        |    1 +
>   tests/qemu-iotests/212                        |    1 +
>   tests/qemu-iotests/213                        |    1 +
>   tests/qemu-iotests/214                        |    1 +
>   tests/qemu-iotests/215                        |    1 +
>   tests/qemu-iotests/216                        |    1 +
>   tests/qemu-iotests/217                        |    1 +
>   tests/qemu-iotests/218                        |    1 +
>   tests/qemu-iotests/219                        |    1 +
>   tests/qemu-iotests/220                        |    1 +
>   tests/qemu-iotests/221                        |    1 +
>   tests/qemu-iotests/222                        |    1 +
>   tests/qemu-iotests/223                        |    1 +
>   tests/qemu-iotests/224                        |    1 +
>   tests/qemu-iotests/225                        |    1 +
>   tests/qemu-iotests/226                        |    1 +
>   tests/qemu-iotests/227                        |    1 +
>   tests/qemu-iotests/228                        |    1 +
>   tests/qemu-iotests/229                        |    1 +
>   tests/qemu-iotests/231                        |    1 +
>   tests/qemu-iotests/232                        |    1 +
>   tests/qemu-iotests/233                        |    1 +
>   tests/qemu-iotests/234                        |    1 +
>   tests/qemu-iotests/235                        |    1 +
>   tests/qemu-iotests/236                        |    1 +
>   tests/qemu-iotests/237                        |    1 +
>   tests/qemu-iotests/238                        |    1 +
>   tests/qemu-iotests/239                        |    1 +
>   tests/qemu-iotests/240                        |    1 +
>   tests/qemu-iotests/241                        |    1 +
>   tests/qemu-iotests/242                        |    1 +
>   tests/qemu-iotests/243                        |    1 +
>   tests/qemu-iotests/244                        |    1 +
>   tests/qemu-iotests/245                        |    1 +
>   tests/qemu-iotests/246                        |    1 +
>   tests/qemu-iotests/247                        |    1 +
>   tests/qemu-iotests/248                        |    1 +
>   tests/qemu-iotests/249                        |    1 +
>   tests/qemu-iotests/250                        |    1 +
>   tests/qemu-iotests/251                        |    1 +
>   tests/qemu-iotests/252                        |    1 +
>   tests/qemu-iotests/253                        |    1 +
>   tests/qemu-iotests/254                        |    1 +
>   tests/qemu-iotests/255                        |    1 +
>   tests/qemu-iotests/256                        |    1 +
>   tests/qemu-iotests/257                        |    1 +
>   tests/qemu-iotests/258                        |    1 +
>   tests/qemu-iotests/259                        |    1 +
>   tests/qemu-iotests/260                        |    1 +
>   tests/qemu-iotests/261                        |    1 +
>   tests/qemu-iotests/262                        |    1 +
>   tests/qemu-iotests/263                        |    1 +
>   tests/qemu-iotests/264                        |    1 +
>   tests/qemu-iotests/265                        |    1 +
>   tests/qemu-iotests/266                        |    1 +
>   tests/qemu-iotests/267                        |    1 +
>   tests/qemu-iotests/268                        |    1 +
>   tests/qemu-iotests/270                        |    1 +
>   tests/qemu-iotests/271                        |    1 +
>   tests/qemu-iotests/271.out                    |   12 +-
>   tests/qemu-iotests/272                        |    1 +
>   tests/qemu-iotests/273                        |    1 +
>   tests/qemu-iotests/274                        |    1 +
>   tests/qemu-iotests/277                        |    3 +-
>   tests/qemu-iotests/279                        |    1 +
>   tests/qemu-iotests/280                        |    1 +
>   tests/qemu-iotests/281                        |    1 +
>   tests/qemu-iotests/282                        |    1 +
>   tests/qemu-iotests/283                        |    1 +
>   tests/qemu-iotests/284                        |    1 +
>   tests/qemu-iotests/286                        |    1 +
>   tests/qemu-iotests/287                        |    1 +
>   tests/qemu-iotests/287.out                    |   10 +-
>   tests/qemu-iotests/288                        |    1 +
>   tests/qemu-iotests/289                        |    1 +
>   tests/qemu-iotests/290                        |    1 +
>   tests/qemu-iotests/291                        |    1 +
>   tests/qemu-iotests/292                        |    1 +
>   tests/qemu-iotests/293                        |    1 +
>   tests/qemu-iotests/294                        |    2 +
>   tests/qemu-iotests/295                        |    1 +
>   tests/qemu-iotests/296                        |    1 +
>   tests/qemu-iotests/297                        |    1 +
>   tests/qemu-iotests/298                        |    0
>   tests/qemu-iotests/299                        |    1 +
>   tests/qemu-iotests/300                        |    1 +
>   tests/qemu-iotests/301                        |    1 +
>   tests/qemu-iotests/302                        |    1 +
>   tests/qemu-iotests/303                        |    3 +-
>   tests/qemu-iotests/304                        |    1 +
>   tests/qemu-iotests/305                        |    1 +
>   tests/qemu-iotests/307                        |    1 +
>   tests/qemu-iotests/308                        |    1 +
>   tests/qemu-iotests/309                        |    1 +
>   tests/qemu-iotests/312                        |    1 +
>   tests/qemu-iotests/check                      | 1085 ++---------------
>   tests/qemu-iotests/common.env.in              |    3 -
>   tests/qemu-iotests/findtests.py               |  159 +++
>   tests/qemu-iotests/group                      |  321 -----
>   tests/qemu-iotests/meson.build                |    3 -
>   tests/qemu-iotests/testenv.py                 |  255 ++++
>   tests/qemu-iotests/testrunner.py              |  344 ++++++
>   .../migrate-bitmaps-postcopy-test}            |    1 +
>   .../migrate-bitmaps-postcopy-test.out}        |    0
>   .../{169 => tests/migrate-bitmaps-test}       |    1 +
>   .../migrate-bitmaps-test.out}                 |    0
>   307 files changed, 1233 insertions(+), 1310 deletions(-)
>   mode change 100644 => 100755 tests/qemu-iotests/283
>   mode change 100644 => 100755 tests/qemu-iotests/298
>   mode change 100644 => 100755 tests/qemu-iotests/299
>   delete mode 100644 tests/qemu-iotests/common.env.in
>   create mode 100644 tests/qemu-iotests/findtests.py
>   delete mode 100644 tests/qemu-iotests/group
>   create mode 100644 tests/qemu-iotests/testenv.py
>   create mode 100644 tests/qemu-iotests/testrunner.py
>   rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (99%)
>   rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
>   rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (99%)
>   rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)
> 



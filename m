Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8311487A19
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:03:51 +0100 (CET)
Received: from localhost ([::1]:43522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5riX-00029s-S0
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:03:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5rgX-0008Pv-HX
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:01:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5rgU-00007h-Fu
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641571301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+jnGcLDqXNkfGetGLqSj7a6Y6sd/mYxkZbz8QO/4Grs=;
 b=OXDLfqgerLai7Y+9O9/hEamgIPucmAq/epPj4NqbPEZ2F0Sd+o9UHXlF+qDAtRKBGE+dha
 j17ETlOIitrnS1U547x2DBbkHFMggtWBAreIPlm1DMQ4RcHZ7S2aPaNMCEfGgyBdD02lqZ
 z+Jd7PF3rOqeuWFKeZvISrTdZfoH//o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-9BAP-u9EOhmfYSHatk9rdw-1; Fri, 07 Jan 2022 11:01:40 -0500
X-MC-Unique: 9BAP-u9EOhmfYSHatk9rdw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c1200b003335872db8dso1036650wms.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 08:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=+jnGcLDqXNkfGetGLqSj7a6Y6sd/mYxkZbz8QO/4Grs=;
 b=oygrme+UMLO9UaszZWDq3e7t0aGUpKi0zTsLEirIbbHgENhi++S0wwB96Q9JowlANt
 ASZ1ZBXD4JZN/aa7V1yBXRix0rlZzUKub8iIt+hRlqsfHiaUPTrh1mx85ppNToOqPsTR
 DixvuszLB9Q3MY4R6Sqr8LBDpJZUmFzZ4MVUYJhDIn2Jg8HIq4l/XziG1VjpjQMs+qdT
 tmzIQLok1yXXTrj+WiiPA5aW2SXgJg3lX9a9nJwtrO7MhHD0kPNkDpJVYurHJKNETYJz
 3Xv7HlP0Xf+kRMnqhSJYPaKZRxDWebtH2yB8UILLjJL+yWc62Pb7YUraIwAeC4yVa5uI
 7oJw==
X-Gm-Message-State: AOAM5323jIlEqH/VeHX/yuHROm5+IAFeAK/rcOo4U64aCAn0uwidU3B3
 DCtjHyUV6sMNgmY6rZnnmobBTmn44hxSZlmSai8WO3FhJXAj1eukR5T9yOK6OK42oc60g1+/PNC
 jGkNyg2gP2YFBWaU=
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr53480426wry.20.1641571298908; 
 Fri, 07 Jan 2022 08:01:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCuSpn+EFA45Ph5LdUxLi81mJ8fS7pIxNeBxVDS+x4SbgFY7JZLvWKIbIoAm5JaW/Z4pa0Lg==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr53480420wry.20.1641571298746; 
 Fri, 07 Jan 2022 08:01:38 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id o10sm5128683wmq.31.2022.01.07.08.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 08:01:37 -0800 (PST)
Message-ID: <9d84ab18-72a6-4913-4c56-ffd02ff386ed@redhat.com>
Date: Fri, 7 Jan 2022 17:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: John Snow <jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: test_isa_retry_flush() in ide-test.c
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi John!

I just notice that test_isa_retry_flush() is not doing anything useful 
anymore: It likely was supposed to run the test_retry_flush() function with 
the "isapc" machine type, but actually test_retry_flush() ignores the 
machine option parameter completely and always uses PCI accessor functions 
nowadays (since commit 9c268f8ae84ae186).
Question is: Is it worth the effort to try to restore the original intended 
behavior for the ISA test here, or shall we rather simply remove it instead 
to save some testing cycles?

  Thomas



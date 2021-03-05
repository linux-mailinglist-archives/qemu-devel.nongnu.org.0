Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8532F32D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:51:52 +0100 (CET)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFYF-0006W2-OM
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lIEzw-0000VL-4C; Fri, 05 Mar 2021 13:16:24 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:44632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lIEzs-0000SP-LZ; Fri, 05 Mar 2021 13:16:23 -0500
Received: by mail-qt1-x82c.google.com with SMTP id t13so1067859qta.11;
 Fri, 05 Mar 2021 10:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=QTM4RW5qPyAWh57z5qMBdEy8ZTwXq5yEX9bHBJICJMo=;
 b=D2xleJLHKBHaykyi5rFve2JfaJxgMkjKBzndUEslk1rYaNdnhDRFMVOBPHt+7Vxk+7
 19ilZuwULEY+3zNIw3BnbLscLOMhWgdRsJYDFrllKV93IwF2ANYK33EUfNmQw8qiz7i5
 WKhNod1qrfKWzTJ4es1JGz07VLWAAntFy7GeGG/Ef/312qH3XNxREGpWzoqQe0OllsTf
 +QKiRJBL+V5QCNmJmqerkL74ZmIAatiEcRL1GFw/5gLP37K4nV57p5XFcW8RcQU7a4Ex
 eqsxx1TUwYwdSpjd4bSDtKTfFZ/an9YOAQDv81wZZ1SAYOy43cQPyes9XiD9Du7QdGA2
 Cnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=QTM4RW5qPyAWh57z5qMBdEy8ZTwXq5yEX9bHBJICJMo=;
 b=ReRkMsdZmm3gP5pf2rdLh5xIywVA6oy6Zv0FRVVdDzqx4xlK6dz/zmJ8zeMnte2THB
 E25lrO2RKsm5VmSYUEJrpQBCJ5HHgqbEY51s3lQlZn0owjzO/lWQgD7GURRa0tR0JYoq
 Sjr7xyIQznWbAoTz1SPQ/5h27nFc3kssuE/XN5rwnMOxMMVo3sltkZ3JpMLt/pVaIvtb
 RpLs7dKK36AprI4IP56EAShX8X2+4g3+kAAL7qPVyOeVdx1BMyWUxLOT1WHIBTlWsUxL
 AGdNYSdodhYImXpU2h8i5OWyeo2ZNPj4Q3m/HUxUo6eXlx0sa2m1S0R1poPhuFkHxJ1R
 ehwg==
X-Gm-Message-State: AOAM5322gYeSQdNR9By6nFWxzlevxQcktfDbGo+dLtg4cc3UhfNWYMCx
 RRn3GRlIOt21v7PX0gkeOMA=
X-Google-Smtp-Source: ABdhPJxm4TbCmwPzc6qQqmeCdA6WewIvm2C+6pbmpSM78GkcAOWBo8j8L04uqBKuoXVCLScbN8oKXQ==
X-Received: by 2002:ac8:5c01:: with SMTP id i1mr9719729qti.328.1614968173821; 
 Fri, 05 Mar 2021 10:16:13 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:1670:7849:4614:f4b6:4112?
 ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id 184sm2314967qki.97.2021.03.05.10.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 10:16:13 -0800 (PST)
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [RFC] adding a generic QAPI event for failed device hotunplug
Message-ID: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
Date: Fri, 5 Mar 2021 15:16:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Recent changes in pseries code (not yet pushed, available at David's
ppc-for-6.0) are using the QAPI event MEM_UNPLUG_ERROR to report memory
hotunplug errors in the pseries machine.

The pseries machine is also using a timeout to cancel CPU hotunplugs that
takes too long to finish (in which we're assuming a guest side error) and
it would be desirable to also send a QAPI event for this case as well.

At this moment, there is no "CPU_UNPLUG_ERROR" in QAPI (guess ACPI doesn't
need it). Before sending patches to implement this new event I had a talk
with David Gibson and he suggested that, instead of adding a new CPU_UNPLUG_ERROR
event, we could add a generic event (e.g. DEVICE_UNPLUG_ERROR) that can be
used by the pseries machine in both error scenarios (MEM and CPU).

This could also be used by x86 as well, although I believe the use of
MEM_UNPLUG_ERROR would need to be kept for awhile to avoid breaking ABI.


Any suggestions/comments?



Thanks,


DHB


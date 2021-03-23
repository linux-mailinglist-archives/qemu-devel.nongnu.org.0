Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF2034666F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:32:55 +0100 (CET)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkti-0004gM-OI
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOkD0-00085f-7H
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOkCw-0000HK-K5
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616518121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GW9oyxo5OLo36KY8k6YFLarWjlwZsj0bFPNeEtbdj9c=;
 b=c9t2MCiu7RTIfFKwgxpuTRayr+BZb2MFCmILgo4p+z+bmwZ2j4tqIpdv6gyARIUiRtTniC
 ZUqy6dEkE6URcZBYXDSvlSKMebzmOC4/5fhjQ60sw44bh2N8x+Kt3Dg6eYAqwus+gHuVGL
 itf6D4xHw+w7gBXmowK/RsdPryx/wYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-JnLy-E3iM0CxtixftSdcVA-1; Tue, 23 Mar 2021 12:48:39 -0400
X-MC-Unique: JnLy-E3iM0CxtixftSdcVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E1E58030B5;
 Tue, 23 Mar 2021 16:48:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB90722E57;
 Tue, 23 Mar 2021 16:48:37 +0000 (UTC)
To: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Crashes with qemu-system-ppc64
Message-ID: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
Date: Tue, 23 Mar 2021 17:48:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


In case anyone is interested in fixing those, there are two regressions with 
qemu-system-ppc64 in the current master branch:

$ ./qemu-system-ppc64 -M ppce500 -device macio-oldworld
qemu-system-ppc64: ../../devel/qemu/softmmu/memory.c:2443: 
memory_region_add_subregion_common: Assertion `!subregion->container' failed.

$ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
/home/thuth/devel/qemu/include/hw/boards.h:24:MACHINE: Object 0x5635bd53af10 
is not an instance of type machine
Aborted (core dumped)

  Thomas



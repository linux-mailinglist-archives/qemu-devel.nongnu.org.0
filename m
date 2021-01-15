Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF12F8856
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:23:07 +0100 (CET)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0XUo-0000gK-Bg
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l0XT2-00008i-Iv
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l0XSz-0004b4-Hr
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610749271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SBM8sb8PuEcBSC4eEAMMX8hNUnTMXvqyX8CxP9WZ77I=;
 b=OBHqL0+Q+QyIboudTjrXkwfuXxmFRTcSsS5ZkRFImZfVCEICNZRhuxVyljeIdQ0w4P3jn2
 2cVb9RgeFDabwgRDxI51aKCcYqyRPFGf7eu7xcEmDuPU7SWbjCuZD2TWxISxMellgANbP+
 ZDuiQry0N0Wv/WcrneuWS9B8TBv0y08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-M3rjHsKUOu2UTUH5aLuCwA-1; Fri, 15 Jan 2021 17:21:09 -0500
X-MC-Unique: M3rjHsKUOu2UTUH5aLuCwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE466CE646;
 Fri, 15 Jan 2021 22:21:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-32.ams2.redhat.com [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9817619C45;
 Fri, 15 Jan 2021 22:21:04 +0000 (UTC)
Subject: Re: [PATCH 2/4] tests/qtest: Make fuzz-test generic to all targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <54b8deab-5636-5821-4743-edc5375f2d76@redhat.com>
Date: Fri, 15 Jan 2021 23:21:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115150936.3333282-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/01/2021 16.09, Philippe Mathieu-Daudé wrote:
> Tests in fuzz-test's main() already check for the supported
> architecture before adding tests, therefore this test is not
> specific to the X86 target. Move it to the generic set.

As long as it does not run any test on non-x86, it does not make sense to 
move it to the generic set, does it? We'd only waste compile cycles that way?

  Thomas



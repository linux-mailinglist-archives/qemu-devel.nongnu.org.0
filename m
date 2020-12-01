Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60742CA79C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:03:24 +0100 (CET)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk87f-0000NA-RX
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kk86N-0007Kd-C8
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:02:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kk86F-00016R-VU
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606838514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTgHTA8y8Un6bZ+RGB+T/YHrr+EgsWumG1HNMJCT5h4=;
 b=M3L9GyWVDrxhV4XYWS2tMG1lI6madqrDV0sG/CJwDZV9Rivlsdk5kWG4npcV53ppePMNJ4
 cRFgMnaoc5TPSiy4Y//Y/yEF9sguTEkquZa5t0la5tcxpEuNmDUwySzZgkgGDToS0mAX7+
 TE8rp8ZT4ShE7CO21SvjNy2xrNwzrAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-3Wk07TcLMR6JAS62BtUA5w-1; Tue, 01 Dec 2020 11:01:52 -0500
X-MC-Unique: 3Wk07TcLMR6JAS62BtUA5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37C04107464F;
 Tue,  1 Dec 2020 16:01:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A75B60C0F;
 Tue,  1 Dec 2020 16:01:47 +0000 (UTC)
Subject: Re: [PATCH 2/3] hw/scsi/megasas: Assert cdb_len is valid in
 megasas_handle_scsi()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201151319.2943325-1-philmd@redhat.com>
 <20201201151319.2943325-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6dfdf7db-0e65-79cd-47e6-6145ea432f9c@redhat.com>
Date: Tue, 1 Dec 2020 17:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201201151319.2943325-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
 Li Qiang <liq3ea@163.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/2020 16.13, Philippe Mathieu-Daudé wrote:
> cdb_len can not be zero... (or less than 6) here, else we have a
> out-of-bound read first in scsi_cdb_length():
> 
>  71 int scsi_cdb_length(uint8_t *buf)
>  72 {
>  73     int cdb_len;
>  74
>  75     switch (buf[0] >> 5) {
>  76     case 0:
>  77         cdb_len = 6;
>  78         break;
> 
> Then another out-of-bound read when the size returned by
> scsi_cdb_length() is used.
> 
> Add a reproducer which triggers:
> 
>   $ make check-qtest-x86_64
>   Running test qtest-x86_64/fuzz-test
>   qemu-system-x86_64: hw/scsi/megasas.c:1679: megasas_handle_scsi: Assertion `cdb_len > 0 && scsi_cdb_length(cdb) >= cdb_len' failed.
>   tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
>   ERROR qtest-x86_64/fuzz-test - too few tests run (expected 1, got 0)
> 
> Inspired-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/scsi/megasas.c       |   1 +
>  tests/qtest/fuzz-test.c | 196 ++++++++++++++++++++++++++++++++++++++++

For the final version, I think you should add the fuzz-test after the fix
(patch 3) ... otherwise this breaks bisection later...

 Thomas



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA394223F1F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 17:06:58 +0200 (CEST)
Received: from localhost ([::1]:56872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwRwv-0006jz-Q3
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 11:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jwRvU-0005j4-Cr
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 11:05:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52063
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jwRvS-0001yr-4p
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 11:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594998324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=mdz+jUB7SnXAP+eWcJtlouYtT06oxyQSctdVN3iRmU0=;
 b=bje50UPMSou+C4LafKFMnKiOJ0vfPrB1lyhP41GLwyE2rkY2ru0QvbEfiaDT9u8+Gi6GMp
 a8Wr/w2Bgx2T/L2F4D494M7ZD/t0PdsC8O9o4qq5hGAy/SY2MtMaokwEds0bhD/rZEwtVw
 2YG9iOsHQuSbXbxPgLOlr3n3+w698l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-68qNFskePcqrY_-6LPlHaw-1; Fri, 17 Jul 2020 11:05:20 -0400
X-MC-Unique: 68qNFskePcqrY_-6LPlHaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78FB81800D42;
 Fri, 17 Jul 2020 15:05:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7358372AF8;
 Fri, 17 Jul 2020 15:05:15 +0000 (UTC)
Subject: Re: [PATCH 1/7] pc-bios: s390x: Fix bootmap.c zipl component entry
 data handling
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20200715094045.381984-1-frankja@linux.ibm.com>
 <20200715094045.381984-2-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <75c4f09d-8354-9ebc-b0ac-baacd8ee282f@redhat.com>
Date: Fri, 17 Jul 2020 17:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200715094045.381984-2-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 23:13:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: borntraeger@de.ibm.com, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/07/2020 11.40, Janosch Frank wrote:
> The two main types of zipl component entries are execute and
> load/data. The last member of the component entry struct therefore
> denotes either a PSW or an address. Let's make this a bit more clear
> by introducing a union and cleaning up the code that uses that struct
> member.
> 
> The execute type component entries written by zipl contain short PSWs,
> not addresses. Let's mask them and only pass the address part to
> jump_to_IPL_code(uint64_t address) because it expects an address as
> visible by the name of the argument.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  pc-bios/s390-ccw/bootmap.c | 5 +++--
>  pc-bios/s390-ccw/bootmap.h | 7 ++++++-
>  2 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



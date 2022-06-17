Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8454F772
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:24:44 +0200 (CEST)
Received: from localhost ([::1]:40320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2B1n-0004fm-2d
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Awy-0001MF-0g
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Awt-0004yN-Gn
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sw6ROPLVInqItqsM+G/Xyp9kYEgVxXiNkIUGYBPRgvQ=;
 b=CUkMvZYbSX6BBQfjuWaSg1y5jD56gKNZoVqukMTb3Pey+/X1FVN+robDRv/XegTP0ZXejM
 cNFDhQQM2janeda7+UEfZFgt7VnKqBN4xwRfgw0nKszLPtg7QGBaNFIdZF7rsBixkzd7ne
 m0viBi+UcpTxju7naYQI5jK8LhiyEv4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-Swb-eOYqNbCl4dXy-WlCLQ-1; Fri, 17 Jun 2022 08:19:36 -0400
X-MC-Unique: Swb-eOYqNbCl4dXy-WlCLQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C95CA3C0D840
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:35 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7D640334E;
 Fri, 17 Jun 2022 12:19:33 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 0/8] qapi: add generator for Golang interface
Date: Fri, 17 Jun 2022 14:19:24 +0200
Message-Id: <20220617121932.249381-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the second iteration of RFC v1:
  https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00226.html


# What this is about?

To generate a simple Golang interface that could communicate with QEMU
over QMP. The Go code that is generated is meant to be used as the bare
bones to exchange QMP messages.

The goal is to have this as a Go module in QEMU gitlab namespace,
similar to what have been done to pyhon-qemu-qmp
  https://gitlab.com/qemu-project/python-qemu-qmp


# Issues raised in RFC v1

  The leading '*' for issues I addressed in this iteration

* 1) Documentation was removed to avoid License issues, by Daniel
     Thread: https://lists.nongnu.org/archive/html/qemu-devel/2022-05/msg01889.html

     It is important for the generated Go module to be compatible with
     Licenses used by projects that would be using this. Copying the
     documentation of the QAPI spec might conflict with GPLv2+.

     I have not proposed another license in this iteration, but I'm
     planning to go with MIT No Attribution, aka MIT-0 [0]. Does it make
     sense to bind the generated code's license to MIT-0 already at
     generator level?

     [0] https://github.com/aws/mit-0/blob/master/MIT-0

  2) Inconsistent generated Names, by Andrea + Markus
     Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg05026.html
     Example 1:
         |    qapi    |    Go     |  Expected |
         | @logappend | Logappend | LogAppend |
 
     Example 2:
         (acronyms) VncInfo and DisplayReloadOptionsVNC
 
     This was not addressed in RFC v2 mainly because it seems to need
     more metadata support from the QAPI spec to handle specific
     scenarios. The solution seems either an extra metadata proposal by
     Andrea [1] or reviving Kevin's work [2]
     
     [1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg00127.html
     [2] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04703.html

* 3) Better type safety, by Andrea + Daniel
     Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01906.html
 
     Most of the 'Any' type (interface {}) has been removed. The only
     place it still exists is for fields that uses QAPI's any type, like
     with command qom-set or the struct type ObjectPropertyInfo.

* 4) QAPI enums mapped to String instead of Int type, by Daniel.
     Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01904.html

     I'm still over the fence about using string here, mostly by the
     same issue reported here:
     https://gitlab.com/libvirt/libvirt-go-module/-/merge_requests/30#note_975517740

* 5) Events and Commands as interface, by Daniel
     Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01914.html

     So, instead of having a Command/Event struct with a Any type for
     the Arguments (which could be set with SetPasswordCommand struct
     type for example); now we have a Command interface which all
     previous structs that behaved as Arguments implement.

     I've included Marshal{Command Event} and Unmarshal{Command Event}
     helper functions that operate on top of each interface.

* 6) Removing Any from Unions, by Daniel
     Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01912.html

     I basically followed the above suggestion to all other types that
     used Any. Specifically to unions were the removal of the
     'discriminator' field, as proposed also in the above link.

* 7) Flat structs by removing embed types. Discussion with Andrea
     Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01590.html 

     No one required it but I decided to give it a try. Major issue that
     I see with this approach is to have generated a few 'Base' structs
     that are now useless. Overall, less nested structs seems better to
     me. Opnions?

     Example:
      | /* This is now useless, should be removed? */
      | type InetSocketAddressBase struct {
      |     Host string `json:"host"`
      |     Port string `json:"port"`
      | }
      |
      | type InetSocketAddress struct {
      |     // Base fields
      |     Host string `json:"host"`
      |     Port string `json:"port"`
      |
      |
      |     Numeric   *bool   `json:"numeric,omitempty"`
      |     To        *uint16 `json:"to,omitempty"`
      |     Ipv4      *bool   `json:"ipv4,omitempty"`
      |     Ipv6      *bool   `json:"ipv6,omitempty"`
      |     KeepAlive *bool   `json:"keep-alive,omitempty"`
      |     Mptcp     *bool   `json:"mptcp,omitempty"`
      | }

  8) Supporting multiple versions
     Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg02147.html

     I'm keen to working on the proposed solution above as it seems a
     good compromise to make code that can be compatible with multiple
     versions of qmp/qemu.

     But the basis needs to be defined first, so this is for the future.

* 9) Handling { "error": { ... } }
     This was missing in the RFC v1. I've added a QapiError type that is
     included in all CommandReturn types, following Andrea's suggestion:

     https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg02199.html


# victortoso/qapi-go and victortoso/qemu

I'm currently hosting the generated code from this RFCv2 at:
    https://gitlab.com/victortoso/qapi-go/-/tree/main/pkg/qapi

This series can also be found at:
    https://gitlab.com/victortoso/qemu/-/commits/qapi-golang


Thanks for taking a look,
Victor

Victor Toso (8):
  qapi: golang: Generate qapi's enum types in Go
  qapi: golang: Generate qapi's alternate types in Go
  qapi: golang: Generate qapi's struct types in Go
  qapi: golang: Generate qapi's union types in Go
  qapi: golang: Generate qapi's event types in Go
  qapi: golang: Generate qapi's command types in Go
  qapi: golang: Add CommandResult type to Go
  qapi: golang: document skip function visit_array_types

 scripts/qapi/golang.py | 765 +++++++++++++++++++++++++++++++++++++++++
 scripts/qapi/main.py   |   2 +
 2 files changed, 767 insertions(+)
 create mode 100644 scripts/qapi/golang.py

-- 
2.36.1



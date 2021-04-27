Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F23136CD39
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 22:50:41 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbUfI-0005HG-Eg
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 16:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbUdi-0004L1-Bk
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 16:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbUdf-0005kk-Py
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 16:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619556538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJf7jZb3d8VgyLMrFSQxeHi8B7obKu/AUHln7LP7D04=;
 b=OuzjGf1j3K7eP7dkFlYrhN2cyYEz3rPlsqvyqcf1OewvWOxJ9FBZf8ARRfliq09wy73wWT
 +ofXh/aRXct3VtmmjVTvPDv9kG8j9JJY815hMzZ1cD9x7+EzFqeTEYDCNTuk4fAv+1bW6S
 PvNf6jfaPhG5HnsBNl+hGgULlnnB0/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-hT6Yn7wnNlSmQTKkfY0ASw-1; Tue, 27 Apr 2021 16:48:57 -0400
X-MC-Unique: hT6Yn7wnNlSmQTKkfY0ASw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45BA1801B12
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 20:48:56 +0000 (UTC)
Received: from localhost (ovpn-116-230.rdu2.redhat.com [10.10.116.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF2EF19C45;
 Tue, 27 Apr 2021 20:48:48 +0000 (UTC)
Date: Tue, 27 Apr 2021 16:48:48 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] Deprecate pmem=on with non-DAX capable backend file
Message-ID: <20210427204848.ubgncujxjxcufpul@habkost.net>
References: <20210111203332.740815-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210111203332.740815-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: thuth@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 03:33:32PM -0500, Igor Mammedov wrote:
> It is not safe to pretend that emulated NVDIMM supports
> persistence while backend actually failed to enable it
> and used non-persistent mapping as fall back.
> Instead of falling-back, QEMU should be more strict and
> error out with clear message that it's not supported.
> So if user asks for persistence (pmem=on), they should
> store backing file on NVDIMM.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

I'm queueing this for 6.1, after changing "since 6.0" to "since 6.1".

Sorry for letting it fall through the cracks.

-- 
Eduardo



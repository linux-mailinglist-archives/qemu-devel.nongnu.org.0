Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C345B8DE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 12:08:00 +0100 (CET)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpq87-0003qG-A6
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 06:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mpq6M-00035D-A4
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:06:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mpq6C-0004aR-32
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637751958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QY1OUUlka18CXsekNQ6zrQYeghXONY+TGsUeexkMazU=;
 b=GRuCkovRzbXisFkvp/9rl1QK65QczxZa3L+zTvjPENiiiawT0J7eUuD5PLPm9A7Lh6NcL/
 UljjQpoi/qD3hhXtTheZheJ7rS1oFYVBTZ42akpWVn705pXGo7PdUJkJcdsHCaq6Tchc+x
 vmjbx09KHxQhJEAcllrb3Zv9HvYmOjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-grXG06y3O4uQnP8IuYYH_g-1; Wed, 24 Nov 2021 06:05:57 -0500
X-MC-Unique: grXG06y3O4uQnP8IuYYH_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C7D101F7B8;
 Wed, 24 Nov 2021 11:05:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA69A4ABA4;
 Wed, 24 Nov 2021 11:05:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 87547180086C; Wed, 24 Nov 2021 12:05:52 +0100 (CET)
Date: Wed, 24 Nov 2021 12:05:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Subject: Re: How to enable virgl in headless mode?
Message-ID: <20211124110552.inssty5eki6v6ywn@sirius.home.kraxel.org>
References: <CAE2XoE-RgL3762rVVjCmTajrPea2-5kcOaSj=qWsa3oHiEP+jw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-RgL3762rVVjCmTajrPea2-5kcOaSj=qWsa3oHiEP+jw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu -display egl-headless

take care,
  Gerd



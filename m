Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A8038C44C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 12:02:29 +0200 (CEST)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk1z8-0000FP-St
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 06:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk1xN-0007u6-8q
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk1xJ-00039H-Fc
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621591231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jW0BcbECqsDHiJRBTTHJEOJR4TpLUglA61CLYgiUFHI=;
 b=Bhl7OF92RdIiL17Y/1IEOfkGzU3kFZcPwTW78GGjzbHM1FoTwOYCNqjiVLiw/QvEuzcDQv
 7sLh4NYw5HPCs9hWjDBF7VhuZRjgKhlueycaxq1zdE/bGqi9GQRu4gP+PprMJ8aHFJ5YL6
 FY/fVxC1HaFE3M1kV70+tnpSjJHd320=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-EmLGiPeBNA2tc2LXR4kRDg-1; Fri, 21 May 2021 06:00:25 -0400
X-MC-Unique: EmLGiPeBNA2tc2LXR4kRDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2DD919253D0;
 Fri, 21 May 2021 10:00:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 588A65D9E3;
 Fri, 21 May 2021 10:00:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DCF9C113865F; Fri, 21 May 2021 12:00:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 02/12] accel: Introduce 'query-accels' QMP command
References: <20210505125806.1263441-1-philmd@redhat.com>
 <20210505125806.1263441-3-philmd@redhat.com>
 <875yzcjvly.fsf@dusky.pond.sub.org>
 <87wnrsifbd.fsf@dusky.pond.sub.org>
Date: Fri, 21 May 2021 12:00:20 +0200
In-Reply-To: <87wnrsifbd.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Fri, 21 May 2021 11:52:54 +0200")
Message-ID: <87mtsoieyz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> The appended incremental patch conditionalizes the enum.  It applies on
> top of the series, and passes "make check" for me.  Seems to contradict
> "we can't make the enum values conditional".

Neglected to mention that query-accel becomes almost useless in this
version: we need it just to pull enum Accelerator into the QMP
interface, so query-qmp-schema shows it.

It may become a useful command if we add more members to AcceleratorInfo
later.



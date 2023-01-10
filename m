Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54441664244
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 14:49:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEHC-0000Ka-OK; Tue, 10 Jan 2023 08:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFEH9-0000J5-Ue
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:02:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFEH8-0005l0-An
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673355764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sznm/hyWmmkHGlzllb4KSqmYbt/uL4Qq/3vEqXw2PI8=;
 b=RiQ0pmAWcganzFyWqNtCYB5W5PJUTPIR92et02mw8qmbS1CptVmyBPkbrv2APoh9ogUNKp
 QIXXYVZ4p7msWkKVBI4uIObHplua6oyIHwSaA/x64h1rVDhqHTosuHa8FKcImll5mlTxPa
 z9MX+nMCswDeSk5AuRwzrx6H5hZ/aD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-R11sYOMHOIi5aqh71wWeyw-1; Tue, 10 Jan 2023 08:02:43 -0500
X-MC-Unique: R11sYOMHOIi5aqh71wWeyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50A31858F09;
 Tue, 10 Jan 2023 13:02:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94D6B2166B29;
 Tue, 10 Jan 2023 13:02:41 +0000 (UTC)
Date: Tue, 10 Jan 2023 14:02:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH 0/4] qom: Introduce object_class_property_deprecate()
Message-ID: <Y71h8JAqYxeB2hPe@redhat.com>
References: <20230109225419.22621-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109225419.22621-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.01.2023 um 23:54 hat Philippe Mathieu-Daudé geschrieben:
> Hi,
> 
> There will always be a need to deprecate things. Here I'm
> tackling the QOM (class) properties, since they can be set
> from some CLI options (-object -device -global ...).
> 
> As an experiment, we add object_class_property_deprecate()
> to register a class property as deprecated (since some version),
> then we deprecate the TYPE_PFLASH_CFI02 'width' property, and
> finally as a bonus we emit a warning when the deprecation period
> is over, as a reminder. (For that we introduce few 'versions'
> helpers).

The last part means that increasing the version number (i.e. the commit
that opens the development tree for the next release) can change the
output, and this is turn can break test cases.

If we are happy to introduce breakage with a version number change that
will require future commits to open the development tree less trivial
than they are today because they need to fix the breakage, too, why not
make it a build error instead of a different warning message at runtime?

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201E21F762F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 11:48:14 +0200 (CEST)
Received: from localhost ([::1]:56050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjgIH-0008SM-8E
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 05:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjgHD-00083b-PD
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 05:47:07 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59853
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjgHC-0007oU-Al
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 05:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591955224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tneUlKlgJfocc9MnBOZhigMz/GVwRXdqSKPBKUUjZP0=;
 b=NlM1CQe2252IhqRNvgzuXy6+77NlUysreRTNoHftbKM6rl0geLFYXhhjwwi5Vl15/cQ9X6
 U5/UvH5Qv0Ja7YeQJDudDt9kEQTCvRrQNmxX2IqemJRAsqS0EapNCLtzZLP5qQkFW/ynb4
 0kJ81vGYFbja+DrQxhzn3enepyVf6t8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-tMqDFib5PweK6vCTcVzBCg-1; Fri, 12 Jun 2020 05:46:57 -0400
X-MC-Unique: tMqDFib5PweK6vCTcVzBCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D19EF835B46;
 Fri, 12 Jun 2020 09:46:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C99D7A8B5;
 Fri, 12 Jun 2020 09:46:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 67C7316E16; Fri, 12 Jun 2020 11:46:55 +0200 (CEST)
Date: Fri, 12 Jun 2020 11:46:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geoffrey McRae <geoff@hostfission.com>
Subject: Re: [PATCH 0/6] audio/jack: fixes to overall jack behaviour
Message-ID: <20200612094655.ytxsb2rydvcek5yj@sirius.home.kraxel.org>
References: <20200612020400.989D93A0172@moya.office.hostfission.com>
 <20200612071137.6sjvpemuxzqzxgsn@sirius.home.kraxel.org>
 <b56d7398cac7d42cccfdf3d6bf50b631@hostfission.com>
MIME-Version: 1.0
In-Reply-To: <b56d7398cac7d42cccfdf3d6bf50b631@hostfission.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 04:55:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 12, 2020 at 06:05:48PM +1000, Geoffrey McRae wrote:
> Thanks, still learning how best to submit these things :)
> Is it worth re-sending this again as per the below?

Most commit messages are rather brief (just the subject line).

For really simple changes ("remove unused state") this is fine,
but for most patches I'd appreciate a more verbose description.

So, yes, please adjust commit messages and resend as thread.

thanks,
  Gerd



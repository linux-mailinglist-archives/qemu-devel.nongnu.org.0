Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D931C29B77D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 16:34:00 +0100 (CET)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQz1-000082-SK
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 11:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kXQnb-0005tY-3X
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 11:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kXQnV-00006U-FO
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 11:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603812117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAZza62aDz54XGQNhUyiYRiYYeS4S8kT5C9HJUxJu40=;
 b=OSGDDQHGTR4gsAX2h7TiaijD0wedBWx2skv/XtyDOZsN3RA0VsZBJc51RNSL2QhzVmVoB6
 RJb4WVvv+B3DuYO1GeEeKuPPi/xQKzudYL8P1J/tvzcHRR6Msn9F8i4WDfM8808gX68NHf
 16yqD87B41fR1J8tYndZBrWm41vpycY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-jyM99pJROB-KmBYGAsJ5lQ-1; Tue, 27 Oct 2020 11:21:53 -0400
X-MC-Unique: jyM99pJROB-KmBYGAsJ5lQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA81C1020904;
 Tue, 27 Oct 2020 15:21:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9203F5B4C6;
 Tue, 27 Oct 2020 15:21:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ADEF816E16; Tue, 27 Oct 2020 16:21:50 +0100 (CET)
Date: Tue, 27 Oct 2020 16:21:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 01/17] build: fix macOS --enable-modules build
Message-ID: <20201027152150.dajghvf72l7ciahd@sirius.home.kraxel.org>
References: <20201026135131.3006712-1-pbonzini@redhat.com>
 <20201026135131.3006712-2-pbonzini@redhat.com>
 <d87ec2b2-225e-353f-e561-e46c2d15b7b1@amsat.org>
 <3f610856-6afe-d3ad-515e-dc736cea0995@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3f610856-6afe-d3ad-515e-dc736cea0995@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Emmanuel Blot <eblot.ml@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 27, 2020 at 02:27:42PM +0100, Paolo Bonzini wrote:
> On 27/10/20 10:27, Philippe Mathieu-Daudé wrote:
> > I'm confused as this broke the catalina-xcode test:
> > 
> > PASS 5 qtest-aarch64/device-introspect-test
> > /aarch64/device/introspect/abstract-interfaces
> > missing object type 'virtio-gpu-device'
> > Broken pipe
> > ../tests/qtest/libqtest.c:176: kill_qemu() detected QEMU death from
> > signal 6 (Abort trap: 6)
> > ERROR qtest-aarch64/device-introspect-test - too few tests run (expected
> > 6, got 5)
> > gmake: *** [Makefile.mtest:905: run-test-111] Error 1
> > 
> 
> It's showing that there is still a bug with macOS modules, Gerd was
> looking at it (Emmanuel could so as well :)).

Turned out to be simple.

https://patchwork.ozlabs.org/project/qemu-devel/patch/20201027120603.3625-1-kraxel@redhat.com/

take care,
  Gerd



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591328D346
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 19:47:12 +0200 (CEST)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSOOE-0000JE-TZ
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 13:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kSONS-0008Iq-Tn
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 13:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kSONP-0004HZ-Qn
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 13:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602611178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5Ywyg+WQLeyRrkW0R++StoNqcY6fFxi0cVcTPC4VEo=;
 b=RZvHtyoUrdQd9OdSIdwHzI88wj9cjc4dF4Z8i03sM+a5n4HrjaoUkClTQFoAxQD6SPeElU
 GNOvg+h+I9HY5FOTTadqFcAxyoySrl7IJXpZ+2jel53Jwzkn0C+J4P8UvLD6rdpXK1GCaH
 0Po0H+4QCOsN3wR+k6shDjEo9/hFwMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-9rmIbJnYOeSlX0ydgtp8ng-1; Tue, 13 Oct 2020 13:46:16 -0400
X-MC-Unique: 9rmIbJnYOeSlX0ydgtp8ng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8A531084D65
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 17:46:15 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A09C35577C;
 Tue, 13 Oct 2020 17:46:12 +0000 (UTC)
Date: Tue, 13 Oct 2020 13:46:11 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2] tests/acceptance: Test case for detecting -object
 crashes
Message-ID: <20201013174611.GA5733@habkost.net>
References: <20201009202905.1845802-1-ehabkost@redhat.com>
 <8daa726a-a359-c533-acb0-e3294b4c8aa7@redhat.com>
 <20201012031859.GC887538@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201012031859.GC887538@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 11, 2020 at 11:18:59PM -0400, Cleber Rosa wrote:
> On Sat, Oct 10, 2020 at 09:54:16AM +0200, Philippe Mathieu-Daudé wrote:
> > On 10/9/20 10:29 PM, Eduardo Habkost wrote:
> > > Add a simple test case that will run QEMU directly (without QMP)
> > > just to check for crashes when using `-object`.
> > > 
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > ---
> > > Changes v1 -> v2:
> > > * "Running command:" log message instead of "Command:" (Cleber)
> > > * Use universal_newlines=True instead of encoding='utf-8' (Cleber)
> > > * Rename devices() to get_devices() (Cleber)
> > > * Use @avocado.fail_on(subprocess.CalledProcessError) (Cleber)
> > > * Reword test_crash() docstring (Cleber)
> > > * Reorder imports
> > 
> > Assuming:
> > Based-on: <20201008202713.1416823-1-ehabkost@redhat.com>
> > 
> > I get:
> > 
> >  (1/2) tests/acceptance/object_option.py:ObjectOption.test_help:
> > qemu-system-avr: No machine specified, and there is no default
> > Use -machine help to list supported machines
> > FAIL: CalledProcessError(1, ['./qemu-system-avr', '-object', 'help']) (0.19
> > s)
> >  (2/2) tests/acceptance/object_option.py:ObjectOption.test_crash:
> > qemu-system-avr: No machine specified, and there is no default
> > Use -machine help to list supported machines
> > FAIL: CalledProcessError(1, ['./qemu-system-avr', '-object', 'help']) (0.18
> > s)
> >
> 
> Did you influence (test parameter?) the QEMU binary to be used?

I'm assuming this was triggered by "make check-acceptance".  I
will change the test case to use '-machine none', which should
work on all architectures.

-- 
Eduardo



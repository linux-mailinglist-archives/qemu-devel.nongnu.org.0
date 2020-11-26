Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D1A2C5004
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 09:13:05 +0100 (CET)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiCOm-0002r5-9Q
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 03:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kiCMP-0002Jm-PB
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 03:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kiCMN-0002aY-4T
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 03:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606378230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C76iuGNW2qqsqlm/ijO1iSaaCENUrdXYPrs33La01b4=;
 b=Fcd0xXcLslnxqKuMi8JrS1YWO7llvPcvPx5JThPIPXFMR84OwxbtOooU2M32gBwPOXKtTz
 xma+XNIpbh8V2l0nAjiFpydfHrCp6HwuYAn10gpKtCSHociATm7GtDj8gJ4W7nYZHfFJbD
 HiHJJviY6q63gydpSrDshFhzGWmOo1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-uKxc-KTqPA-IfsT6KmReXg-1; Thu, 26 Nov 2020 03:10:20 -0500
X-MC-Unique: uKxc-KTqPA-IfsT6KmReXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80C8680B70A;
 Thu, 26 Nov 2020 08:10:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5828819C66;
 Thu, 26 Nov 2020 08:10:15 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Subject: Proposal for a regular upstream performance testing
Message-ID: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
Date: Thu, 26 Nov 2020 09:10:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ldoktor@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello guys,

I had been around qemu on the Avocado-vt side for quite some time and a while ago I shifted my focus on performance testing. Currently I am not aware of any upstream CI that would continuously monitor the upstream qemu performance and I'd like to change that. There is a lot to cover so please bear with me.

Goal
====

The goal of this initiative is to detect system-wide performance regressions as well as improvements early, ideally pin-point the individual commits and notify people that they should fix things. All in upstream and ideally with least human interaction possible.

Unlike the recent work of Ahmed Karaman's https://ahmedkrmn.github.io/TCG-Continuous-Benchmarking/ my aim is on the system-wide performance inside the guest (like fio, uperf, ...)

Tools
=====

In house we have several different tools used by various teams and I bet there are tons of other tools out there that can do that. I can not speak for all teams but over the time many teams at Red Hat have come to like pbench https://distributed-system-analysis.github.io/pbench/ to run the tests and produce machine readable results and use other tools (Ansible, scripts, ...) to provision the systems and to generate the comparisons.

As for myself I used python for PoC and over the last year I pushed hard to turn it into a usable and sensible tool which I'd like to offer: https://run-perf.readthedocs.io/en/latest/ anyway I am open to suggestions and comparisons. As I am using it downstream to watch regressions I do plan on keep developing the tool as well as the pipelines (unless a better tool is found that would replace it or it's parts).

How
===

This is a tough question. Ideally this should be a standalone service that would only notify the author of the patch that caused the change with a bunch of useful data so they can either address the issue or just be aware of this change and mark it as expected.

Ideally the community should have a way to also issue their custom builds in order to verify their patches so they can debug and address issues better than just commit to qemu-master.

The problem with those is that we can not simply use travis/gitlab/... machines for running those tests, because we are measuring in-guest actual performance. We can't just stop the time when the machine decides to schedule another container/vm. I briefly checked the public bare-metal offerings like rackspace but these are most probably not sufficient either because (unless I'm wrong) they only give you a machine but it is not guaranteed that it will be the same machine the next time. If we are to compare the results we don't need just the same model, we really need the very same machine. Any change to the machine might lead to a significant difference (disk replacement, even firmware update...).

Solution 1
----------

Doing this for downstream builds I can start doing this for upstream as well. At this point I can offer a single pipeline watching only changes in qemu (downstream we are checking distro/kernel changes as well but that would require too much time at this point) on a single x86_64 machine. I can not offer a public access to the testing machine, not even checking custom builds (unless someone provides me a publicly available machine(s) that I would use for this). What I can offer is running the checks on the latest qemu master, publishing the reports, bisecting issues and notifying people about the changes. An example of a report can be found here: https://drive.google.com/file/d/1V2w7QpSuybNusUaGxnyT5zTUvtZDOfsb/view?usp=sharing a documentation of the format is here: https://run-perf.readthedocs.io/en/latest/scripts.html#html-results I can also attach the raw pbench results if needed (as well as details about the tests that were executed and the params and other details).

Currently the covered scenarios would be a default libvirt machine with qcow2 storage and tuned libvirt machine (cpus, hugepages, numa, raw disk...) running fio, uperf and linpack on the latest GA RHEL. In the future I can add/tweak the scenarios as well as tests selection based on your feedback.

Solution 2
----------

I can offer a documentation: https://run-perf.readthedocs.io/en/latest/jenkins.html and someone can fork/inspire by it and setup the pipelines on their system, making it available to the outside world, add your custom scenarios and variants. Note the setup does not require Jenkins, it's just an example and could be easily turned into a cronjob or whatever you chose.

Solution 3
----------

You name it. I bet there are many other ways to perform system-wide performance testing.

Regards,
Lukáš



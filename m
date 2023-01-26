Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15467D478
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:42:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7CA-0001PE-Vg; Thu, 26 Jan 2023 13:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pL7C7-0001OZ-Ej
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:41:56 -0500
Received: from [209.195.0.149] (helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pL7C4-0007KZ-HO
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:41:54 -0500
Received: by npcomp.net (Postfix, from userid 1000)
 id 9A7F62BEE; Thu, 26 Jan 2023 18:41:50 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1674758510;
 bh=XnpdijiXZzFGNg67Zl8St8pmY09TVWH5t42XKmubNDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=zXw9rDMxUBDpwOVsibQbFUVDFaIVNzlP7/2XO1w2xYHjlPday886vP9+qehYfXrgm
 hRPwPd+PWT5sT7xsTjDiVb1Y8PW7wTWcyNAzlxLkpXzPS9AgesCMbtkrdscwQCD1yd
 3PKLyTPwGz5spH9//hFuqQr8JQSaoLTBV1dKNUsE=
Date: Thu, 26 Jan 2023 18:41:50 +0000
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: no more pullreq processing til February
Message-ID: <Y9LJbvFf0N3BJBKq@invalid>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <Y9KFp06pp/qohgV1@invalid> <87h6wdpeig.fsf@linaro.org>
 <Y9KQX2pa6I7n/uvT@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9KQX2pa6I7n/uvT@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 209.195.0.149 (failed)
Received-SPF: pass client-ip=209.195.0.149;
 envelope-from=eldon-qemu@eldondev.com; helo=npcomp.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Jan 26, 2023 at 02:38:23PM +0000, Daniel P. Berrangé wrote:
> The current approach for provisioning our private runners is highly
> undesirable IMHO. We are installing the full set of build deps on
> the host OS install, at time of provisioning the runner.
> 
> We should instead be provisioning the hosts exclusively to have
> docker, and then use containers for the build + test environment,
> so we don't need to have sysadmin intervention on the runners when
> a merge request adds a build dep.
> 
> If we want to new private runners to replace the shared runners
> transparently, then the use of docker is basically a must have.

This is how I currently do yocto builds for my current primary concern,
provision the machines, and the docker-compose run the tests and builds.

As far as baremetal goes, I find authenticated IPXE scripts work well
for a number of these scenarios, and permit very dynamic allocation of
resources. I have been a fan of the ignition/coreos/fcos strategy for
baremetal deployment due to the capability to run the full system in
memory, as writing packaging to disk can waste time and flash in my
opinion. I strongly agree with the benefits of managing these components
in the repo. Dockerfile, ignition config, or cloud-config would probably
work.  Dockerfile makes sense to me if existing work in that direction
has interest and docker is sufficiently flexible for the tests. That
said, it may be easier to generate an appropriate cloud-config if no
work is yet done on running tests inside docker.

I have looked through the .gitlab-cl.d directory in the repo, and it
seems that there is existing work done with containers in the
container-template.yml. Do we also incur minutes for our cirrus builds
equivalent to the duration of the build on cirrus? Maybe relocation
those builds would be the most effective? It seems that a number of
builds unrelated to cirrus use containers already, or I am missing
something?

I will try to familiarize myself further with this directory. I will try
adding some runners to my fork and seeing what the tests look like
there.

Thanks,
Eldon


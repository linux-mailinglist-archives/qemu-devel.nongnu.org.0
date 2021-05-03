Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA1A371426
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:18:34 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWau-0004vP-OO
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldWZQ-00045a-Vq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldWZO-00069D-42
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620040617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U06S4EQ2D9BwyJz5QxZ5+fqrSJjSbY74gwJ3zeAELpc=;
 b=YUMm1J52R7az+RuL7cYN03qz7015Bj6C1O70O6mb48ahnFpzagAqT+PTZugM3uBG9pokje
 mAq96rh11tJixYAsD1BR8guNkqhp7kBGheoKChpAzGT1VqHCVulWXABqPLu1dbxVOuSueH
 cMFhqi6oGkPqFCYxQ1C9camqLZnEkmc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-WhWsHRYoO62-BsHrVk_M3w-1; Mon, 03 May 2021 07:16:55 -0400
X-MC-Unique: WhWsHRYoO62-BsHrVk_M3w-1
Received: by mail-wm1-f70.google.com with SMTP id
 c205-20020a1c9ad60000b02901477e6d427bso1952191wme.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:cc:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=U06S4EQ2D9BwyJz5QxZ5+fqrSJjSbY74gwJ3zeAELpc=;
 b=J5UPWDFJPE3vYXcqC/XC75l0mIefXNVJD3y4iiWTaah8NaXx1KlQ4t3766wSMzLkca
 qPcj8TpbdGKNQcfy16gU01D6/8/0D+F1jbSrzdK5Re0Ghymiv2nzWJCpBC92/TvCwPqI
 cf8abX/S2N1A7ATZXCY7xusKNx2jD1+7v9ZuGbw2sR3g/cuMjodMloEGwSf1Xk7WWHWT
 LUUyizNCrCISQH5W6K1HaRu7McH22ChjvT1oAWV3HbRd24nulnFoHjx9cnyERH44DIxc
 ffVwda8i/77sEYw8nuvArfAE4xGhGHg3PurjaXPDZjydmxc8b7jCJCANUeVfbKtZ4Qxc
 irnQ==
X-Gm-Message-State: AOAM533cLbmHs1MCyconayuUMuOrWyI9PiFi/Wwrq5ujeMkrQYr/y9sV
 w1HqumI/u3afxKRLgYpbeMih4YUl+SZ+WnGQMgU1/Ih5MXsmKmKtNqFDieHk9S2LrbGPx5BEekY
 mO6alj9MOT6Pd+qg=
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr31882482wmj.128.1620040614537; 
 Mon, 03 May 2021 04:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8lSXGMxziwWUFV3TG74Xboh2ozuscxUYAsva6ZsMmSOAysBMtAzyRVBZinxYYeEk1NDNEEg==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr31882456wmj.128.1620040614269; 
 Mon, 03 May 2021 04:16:54 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id d2sm11973013wrs.10.2021.05.03.04.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 04:16:53 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Switching to the GitLab bug tracker
Message-ID: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
Date: Mon, 3 May 2021 13:16:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi everybody!

As you might have already noticed by some other mails on the qemu-devel 
mailing list, we are in progress of switching our bug tracking tool from 
Launchpad to Gitlab. The new tracker can now be found here:

  https://gitlab.com/qemu-project/qemu/-/issues

Please note that this has some implications:

1) We likely won't have the possibility anymore to automatically send e-mail 
notifications for new bugs to the qemu-devel mailing list. If you want to 
get informed about new bugs, please use the notification mechanism from 
Gitlab instead. That means, log into your gitlab account, browse to

  https://gitlab.com/qemu-project/qemu

and click on the bell icon at the top of the page to manage your 
notifications, e.g. enable notifications for "New issues" there.

2) It should be possible for everybody who has a Gitlab account to open new 
bugs. If you are a maintainer of one of the QEMU subsystems, you might want 
to help with changing certain aspects of bug tickets, too, e.g. add labels 
or assign a ticket to you or somebody else. In that case you need to be 
listed as a "Reporter" in the QEMU project, so please then get in touch with 
one of the "Owners" of the project (see 
https://gitlab.com/qemu-project/qemu/-/project_members ) and ask them to add 
you as a "Reporter".

3) Gitlab has a nice mechanism for closing bugs automatically once the fix 
gets merged to the master branch. To use this feature, please mark your 
commit messages with a "Resolves: <URL-to-the-ticket>" line. See:

https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically

4) I'm in progress of automatically migrating the open bug tickets from 
Launchpad to the Gitlab tracker. If you're interested, please keep an eye on 
those tickets and tell me if you spot any oddity there - the script that I'm 
using for the migration might not be perfect yet.

  Thomas



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E36A7B75
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 07:42:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXcdk-0008HW-KA; Thu, 02 Mar 2023 01:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXcde-0008HL-Fb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 01:42:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXcdc-0007kd-62
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 01:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677739318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=ylXimtzB+ymGHLbtsqidiGwjVRyJ17VCSfXLE/ASye0=;
 b=LZRXPA2qBGbTHGBmQSWMQk2e/fHIRj3SZ/UA4P63ekV9Cjx2uhHlrF9cJmGVF0MA2h7Mlg
 91EAP65DhkJyehrmYcmY+jRIB/f6xFwb8qTYiKW7UrchB2WbXwsmQ5d1nqspTMFfvj3V9k
 MHMBJ/NaJZAaQzkOYnsispS3A0YtOGw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-R04blifzMQiIR501VSfzaA-1; Thu, 02 Mar 2023 01:41:41 -0500
X-MC-Unique: R04blifzMQiIR501VSfzaA-1
Received: by mail-wm1-f71.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso5359419wmb.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 22:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677739299;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ylXimtzB+ymGHLbtsqidiGwjVRyJ17VCSfXLE/ASye0=;
 b=PG9+mLewMlyllajOzIiFLsIcH1+7tk2ik1hGwpp7rm1XkU/Z7sEd9iuCcOybx3hrkp
 2iGBU95LsrEHP0LhF8h04Z6KZq2VqO5PDoh3E1nOuZcjaqOYFzQUWvg0EcGXIhI05qLs
 p1OGmavgBCGVubhESuDYSsgpuy7xtzeG7tHicJAaikLWMcM0qvSmUQBuV3OIUXo8xEoD
 8P99smrsq2c5QtLZCRX8GO4mQwiiQ/l/A6htTuFgr1Pmj12tUyiQV47Hvlh9iUPaqZsp
 fzbbpi3HF6/1bqjz5IHOAb8fLSaZ0dxOi5yy5/A2HPdGyfA7vDQ1RcCDg6ompa2IXFgl
 xLIw==
X-Gm-Message-State: AO0yUKV3TQxhKfCS5GGJAP7yVj5ZOmvduK46bJLQpFPZ7eXOrJaZY2ng
 lt9NZ/5dt6mMc03EHLiNP8I4YkTSBZNzv5tg9uk48TPa5J9HR5OZbdcpCaPVJP/A+PZp/HJsqij
 gPQQ4KzJNXqp+flpjMhRf4R5RkEghwgzPyOYF4y8DNBFgtb4AmNEYZLSRM6cO/iWYHQ==
X-Received: by 2002:a05:600c:3d8e:b0:3eb:4cb5:e13 with SMTP id
 bi14-20020a05600c3d8e00b003eb4cb50e13mr7184089wmb.31.1677739299664; 
 Wed, 01 Mar 2023 22:41:39 -0800 (PST)
X-Google-Smtp-Source: AK7set81wlu5/NR9gk2npYFBMYc0l6cLT3CBlQQfveDrlbw7mCpfS1cF7u3Zl4enZ/xH2ByCzRSTyA==
X-Received: by 2002:a05:600c:3d8e:b0:3eb:4cb5:e13 with SMTP id
 bi14-20020a05600c3d8e00b003eb4cb50e13mr7184073wmb.31.1677739299345; 
 Wed, 01 Mar 2023 22:41:39 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002c561805a4csm14711490wrm.45.2023.03.01.22.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 22:41:38 -0800 (PST)
Date: Thu, 2 Mar 2023 01:41:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: duplicate acpi files
Message-ID: <20230302013223-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Hi guys,
I got annoyed that whenever I run ./tests/data/acpi/rebuild-expected-aml.sh
then my tree gets polluted with duplicate acpi files.
If I forget to blow them away then later they become stale
and bios table test fails.

So wrote a script to find these hoping to teach rebuild-expected-aml.sh
not to generate these:

find tests/data/acpi/ -type f -exec sha256sum '{}' ';'|sort -d|uniq -w 64 --all-repeated=separate

Turns out we have lots of duplicates already!
These generally increase churn and make review and maintainance of aml
harder - I will remove the trivial ones but slightly harder issues:
- unifying pc and q35 - I guess we can teach bios table test to look
  for expected files one
  directory up and put pc and q35 in a shared directory.
- teaching rebuild-expected-aml.sh to remove duplicates.
- we really should first generate in some temp directory,
  then have a separate script to move files over, this way we can also
  do useful things like tell user what changed - or even pre-generate
  a good git commit message.

I have been using the following script but it expects files to
already be in git, not ideal:

SCM=`pwd`
temp=$(mktemp -d)
status=$?
[ -z "${file}" ] || exit $status
cd ${temp}
rm -fr old new
git clone ${SCM} old
git clone ${SCM} new
cd ${temp}/old
git checkout ${1}
./tests/data/acpi/disassemle-aml.sh -o ${temp}/old/asl
cd ${temp}/new
git checkout ${2}
./tests/data/acpi/disassemle-aml.sh -o ${temp}/new/asl
cd ${temp}
# skip irrelevant header fields
# prefix diff output so it's can be safely included in git log
diff -ru -N -IDisassembly -IChecksum -I'*     Length           ' old/asl new/asl | sed -e 's/^---\|+++\|@@\|diff/:&/'
rm -fr ${temp}


One of you want to try improving on these issues?

-- 
MST



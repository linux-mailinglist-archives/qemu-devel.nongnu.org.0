Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A95633D0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:56:53 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GCZ-0002vJ-OW
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7GAu-00023Y-De
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:55:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7GAq-0000XL-J0
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656680102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ke+hzN69RwuloauRNzUJk/bxxVsjKcAW5UlCukW4cJQ=;
 b=Q9GGE4LF79MrNVJCbHkMZJn8UPGC+1UifACryvL2QdLoYkmZOp3mqn7Cyl2qlWcNpm9K2V
 Z3dUsZM2RcZJi8AJJnGIWXKQTX003vYBgZCDFbXc7t8Whip4feeF6nVT/N5ep5C9mDKjnL
 xy4nYP2DMWt3mueaBeAhPX8QCKV4cHc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265--joEsI2EOq-7nHhzYgQ_VQ-1; Fri, 01 Jul 2022 08:55:01 -0400
X-MC-Unique: -joEsI2EOq-7nHhzYgQ_VQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 qk8-20020a1709077f8800b00722fcbfdcf7so748828ejc.2
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ke+hzN69RwuloauRNzUJk/bxxVsjKcAW5UlCukW4cJQ=;
 b=dyKBwEvySsB/52deOaTYwjh/JS1bKQHETK7aPzvZH9S8tDry16Kmj9jWfFhsi1D/Xw
 1lI+Nh2nezOfOoXr/OgZqbUJ+p5ED3z8DNGQGOFzNmMFr3zkM+Cv39Q2SEcDar2DLnxk
 7wbL3PYZ2B8k9vCSoB93FvrmPIaEBKP2S8fw2pR400KyDLUR7QGtynHWPfrA3D98XTJP
 lrtb9YIBWSYTvD1K+FEQLvyAiWpGI3/jBJ8ZhRMpk7pMGj9JbtD/cxdf6gu34UUYZxw1
 ACggLnyUJW3jy8xzjcUVmxC43cwEz3HcCnYoDXWONI1KUs+4Kb4nFva6/T9A55J1xLqA
 FeOA==
X-Gm-Message-State: AJIora8wfKG9l+Z/RQi0uv8LouUryPlqCfIQTqw2eK+npcxnR/lZFt73
 ZG+7l7rJ6aP4nbGTTTCHVScEyEuSJyvl7+8V5dX32PAWViiMYxGLIUqO9noL2hTQu9NquBF5uAl
 yayHokBAgbo16y48=
X-Received: by 2002:a17:907:7245:b0:726:a909:902e with SMTP id
 ds5-20020a170907724500b00726a909902emr14409026ejc.308.1656680100582; 
 Fri, 01 Jul 2022 05:55:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t7ijbFtX5q68b07lknKeiBVpUp3hvZ1UuPcJ4XurCQWSvOeCnyuq9RPvInHQSfWj4wgijR1g==
X-Received: by 2002:a17:907:7245:b0:726:a909:902e with SMTP id
 ds5-20020a170907724500b00726a909902emr14408991ejc.308.1656680100310; 
 Fri, 01 Jul 2022 05:55:00 -0700 (PDT)
Received: from redhat.com ([2.55.3.188]) by smtp.gmail.com with ESMTPSA id
 k5-20020a1709067ac500b006fee526ed72sm10437200ejo.217.2022.07.01.05.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 05:54:59 -0700 (PDT)
Date: Fri, 1 Jul 2022 08:54:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220701082552-mutt-send-email-mst@kernel.org>
References: <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
 <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
 <20220701024108-mutt-send-email-mst@kernel.org>
 <CAARzgwxnFRN=y9qz0ERiLOxMBCxEyxsn=xW_-i8mawWPj1Dxqw@mail.gmail.com>
 <20220701033006-mutt-send-email-mst@kernel.org>
 <CAARzgwwhrsG1EkA9=kH9Y456_Yz5KEA9tMQoQ6wGufoPGTu69w@mail.gmail.com>
 <20220701053949-mutt-send-email-mst@kernel.org>
 <CAARzgwx4GKLvATe+X+jZQminm1xAM7sgxXeeDQn_KHDozyde+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwx4GKLvATe+X+jZQminm1xAM7sgxXeeDQn_KHDozyde+A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 01, 2022 at 03:44:32PM +0530, Ani Sinha wrote:
> but I thought you were suggesting we built bits every time the test is run?

In my opinion 3 scenarios are worth supporting:
- people not touching ACPI, including users - simply don't run the tests,
	comparing tables with expected output should be enough
- people making changes indirectly affecting ACPI -
 	use tests to validate that tables are still well formed,
	using a pre built binary should be enough IMO
- people working on ACPI - use tests to analyse the tables,
	building from source might be necessary for debugging,
	sources change very rarely
- people developing the tests
	building from source is required

So I would suggest basically two github repos, one with binaries one with
sources. We'll keep relevant hashes to use in the script.
All in all not that different from submodules but I guess
people have submodules and that is that.

And I personally would probably not tie it to CI whoever owns the
repository can worry about the builds, and I think keeping
things distributed is important.

So
- people not touching ACPI - make check should see directory not found
	and skip the test
- people making changes indirectly affecting ACPI -
	check out binaries and use
- people working on ACPI -
	see that source directory is present, go there
	and run make. should not rebuild each time right?
- people developing the tests
	building from source is required


-- 
MST



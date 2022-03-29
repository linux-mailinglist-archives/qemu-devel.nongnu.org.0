Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D274EAE13
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:03:29 +0200 (CEST)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBVQ-0007ll-FO
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:03:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1nZ9hp-0004ma-R4
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:08:10 -0400
Received: from [2a00:1450:4864:20::42c] (port=34579
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1nZ9hl-0006Dm-D5
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:08:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m30so24278985wrb.1
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SD9wgTBt6PU47PZC86nAHIW6ArDy+8cBrdIBJHx/nMo=;
 b=k137d8lPXS3eHJgeyu7Urk+PVeHWCva46wRJuSr2gi7U3qYO6iUlLdZgbeJMVhKRAt
 88tfFjGj4NvNz5EJ7KJqmm4g2i+wdYUmrsy49L1taq8IwnkUzcCI9gtl5CXg9cjiecTS
 CjIH7pZDyrVRv3zMyBeY7mZAtQ+ggwinZkGzWqT+hsaSq0zgDw2Gny79dsgx59Mw2i3U
 hU1sZQTkD7I0zb/VrFi5V5j7eivKohm8zrFr9P7Aw/Hc9Dy40m3pmaXk5apCgHx/oOb2
 bkU+5h4UIwVsx7loFOWN5DnD0nGX6CBeOFvbb7Poy0GjzUN5iXKfClM3NrzRYhRDQbFW
 jI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SD9wgTBt6PU47PZC86nAHIW6ArDy+8cBrdIBJHx/nMo=;
 b=OxR1+2WaTiM/kvzrrA0D0iiVy/tbEbObyv8h4LMAIKyxwTe6c949r8fZB14C8lGrX5
 65lgCqEoJN+flwGfUOh5IrufGwD8tZGAAEd1BsrGXRdDPYdZsRCXQw7/ir5nf5ZsecjK
 lo82+tWaMFobmnqiXZvwFp1WjA+IMBzX21ZvHhIZFqR7nPxl4JFLk9y/cJgC3bKSRSvp
 jdvkwoC2SmQctsD7oIQtWVAsObD6DpM54bjqj/VmU9f35ScyyIV4wDTTs1EaL4GMNzMI
 Wf5xHl2WtIm4BKXeK40HdV1mb1i66XcPJ8bybO0iso8LEAE+c6C5mTZ2j6CDyPXvac5g
 k1Ng==
X-Gm-Message-State: AOAM53121jZcQ0ytG2aiUSDodUphNE4+CIHm/bguAWsdQAui6ZfJjkaw
 GVKLB5+CDHomppU4BA8uSCTzSQ==
X-Google-Smtp-Source: ABdhPJzx0NoynyI/iKyyxdFIxbOWFia6y+/MtnKpTseiR98vcMno0O3EyQ2C0tmtnOe/ui5EqOCW9Q==
X-Received: by 2002:a5d:6d0a:0:b0:204:109f:7833 with SMTP id
 e10-20020a5d6d0a000000b00204109f7833mr30732694wrq.76.1648552083045; 
 Tue, 29 Mar 2022 04:08:03 -0700 (PDT)
Received: from localhost ([91.110.139.125]) by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6dac000000b00204119d37d0sm15300639wrs.26.2022.03.29.04.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:08:02 -0700 (PDT)
From: Fam Zheng <fam.zheng@bytedance.com>
X-Google-Original-From: Fam Zheng <fam@euphon.net>
Date: Tue, 29 Mar 2022 12:08:02 +0100
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
Message-ID: <20220329110802.GB447081@fam-dell>
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-4-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325200438.2556381-4-jsnow@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=fam.zheng@bytedance.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Mar 2022 09:00:26 -0400
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <mlureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-03-25 16:04, John Snow wrote:
> qmp-shell is presently licensed as GPLv2 (only). I intend to include
> this tool as an add-on to an LGPLv2+ library package hosted on
> PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
> licenses while retaining a copyleft license.
> 
> To keep licensing matters simple, I'd like to relicense this tool as
> LGPLv2+ as well in order to keep the resultant license of the hosted
> release files simple -- even if library users won't "link against" this
> command line tool.
> 
> Therefore, I am asking permission from the current authors of this
> tool to loosen the license. At present, those people are:
> 
> - John Snow (me!), 411/609
> - Luiz Capitulino, Author, 97/609
> - Daniel Berrangé, 81/609
> - Eduardo Habkost, 10/609
> - Marc-André Lureau, 6/609
> - Fam Zheng, 3/609
> - Cleber Rosa, 1/609
> 
> (All of which appear to have been written under redhat.com addresses.)
> 
> Eduardo's fixes are largely automated from 2to3 conversion tools and may
> not necessarily constitute authorship, but his signature would put to
> rest any questions.
> 
> Cleber's changes concern a single import statement change. Also won't
> hurt to ask.
> 
> CC: Luiz Capitulino <lcapitulino@redhat.com>
> CC: Daniel Berrange <berrange@redhat.com>
> CC: Eduardo Habkost <ehabkost@habkost.com>
> CC: Marc-André Lureau <mlureau@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Cleber Rosa <crosa@redhat.com>
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

No longer wearing that hat any more so maybe my reply doesn't matter, but since
I'm Cc'ed with my new address, I am personally happy with the re-licensing:

Acked-by: Fam Zheng <fam@euphon.net>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C1F618362
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:00:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqccE-0004sm-H4; Thu, 03 Nov 2022 11:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqccB-0004sR-PN
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 11:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqccA-0005J2-5m
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 11:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667491125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sM6mmbP28ZpERoNQPmWBIwolyqeF4wGydWZSvmSWlxY=;
 b=HRPw6VlrLRQisRDCSKvtx8GmbacT+ce85LcKwKSSKkITHDL9lcwlb6L+6qI9T/+pIc3LNh
 02hq9n9VRx5H0pAcODvNPZQy0JxCll8zqIsU36Qb607EREWQ9FWA0m14esrrajq9XZed/r
 XrtovEzELe/3RvWkwhcjuphJ5T6SPa8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-1mT05A1DMLC0KLnLQdxIug-1; Thu, 03 Nov 2022 11:58:43 -0400
X-MC-Unique: 1mT05A1DMLC0KLnLQdxIug-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so2060040wmb.5
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 08:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sM6mmbP28ZpERoNQPmWBIwolyqeF4wGydWZSvmSWlxY=;
 b=tOkr8m13HOd9ETLK1pxCgOZKdSfj3+AtkyJXfC9wDX/cbs87zYuSh+5ver5TI+Wn6X
 QXBPPOtOTTKZd4WXFrXwePI6qNdfz0pW40Wivw4nNZ5oLjQk8s7Ioo7D1O2AukW49GKi
 12BI2PWWiKvK4hpmjKoS0Nk7jsIOveIltLhIH2PMJiQIwDI0/XjPdi0ws9YGv2myt7r+
 cQ5Hoo06pYy/qhP5jnBNATYSmyylB+K404pL7k+Ntmhh/31NFonKZRk4bV1jfT3MGHxp
 es0hB3rhQHRuOgqh6MRJ+3ujc86E5Cge1zFebthcFAVtDjTE+QTT+Wr1XxxIyq7TVp9V
 Ix4Q==
X-Gm-Message-State: ACrzQf0Ds7db/X+PWjsQ40NicBuWdbbogZuPpWD2MjVdxKu428xHpGaI
 hvIbuR2MOSCsvPFBPkSiIPkXpwyuQlhbmr16O2SNV5zB2dZGO1egwPg6NDzmMt0UR8SDf2ftywM
 R+raK7bK4WNBtK/o=
X-Received: by 2002:a05:600c:1d91:b0:3cf:7b89:669f with SMTP id
 p17-20020a05600c1d9100b003cf7b89669fmr11440569wms.155.1667491122026; 
 Thu, 03 Nov 2022 08:58:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4S0B1tk7oC0IcJqY8dAK/pQhsplyPq3eYY6ND3FLa8KZIEQTt5MdBGjLNqlNXBnVRVw19JGg==
X-Received: by 2002:a05:600c:1d91:b0:3cf:7b89:669f with SMTP id
 p17-20020a05600c1d9100b003cf7b89669fmr11440550wms.155.1667491121776; 
 Thu, 03 Nov 2022 08:58:41 -0700 (PDT)
Received: from redhat.com ([2.55.58.252]) by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm1572014wrb.99.2022.11.03.08.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 08:58:41 -0700 (PDT)
Date: Thu, 3 Nov 2022 11:58:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Ani Sinha <ani@anisinha.ca>, philmd@linaro.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221103115817-mutt-send-email-mst@kernel.org>
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 11:49:21AM -0400, Stefan Hajnoczi wrote:
> gitlab-runner can run locally with minimal setup:
> https://bagong.gitlab.io/posts/run-gitlab-ci-locally/
> 
> I haven't tried it yet, but that seems like the most reliable (and
> easiest) way to reproduce the CI environment.
> 
> Stefan

How does one pass in variables do you know? Environment?

-- 
MST



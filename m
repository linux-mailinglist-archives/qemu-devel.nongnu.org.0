Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95740AE8D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:06:25 +0200 (CEST)
Received: from localhost ([::1]:59228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ88m-0004go-40
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mQ837-0004sQ-Tc
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mQ82y-0007Zg-1m
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLbvbWGitHxMIdP9qdAqUbf1kgHN6EUx48sLs7z7zBE=;
 b=gd9d3+W0r5HhxH+OF2c+SI3yBBqCHjgzANXhPL7x5p32A3lNUOoYcYHtcyNBStkWulhepb
 1776A12l1Y4rG0vhngLAgFW8LGBo94qgS+GqgSYkOVFjhB4Zjnb7Sz7QWX8cpJrB8VkNmu
 qP2m+FRGEO8rZagD7ays/5ku9OW0wmg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-vNvICC6eMu-sd1oY8QYT3w-1; Tue, 14 Sep 2021 09:00:21 -0400
X-MC-Unique: vNvICC6eMu-sd1oY8QYT3w-1
Received: by mail-ed1-f69.google.com with SMTP id
 y17-20020a50e611000000b003d051004603so6061915edm.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLbvbWGitHxMIdP9qdAqUbf1kgHN6EUx48sLs7z7zBE=;
 b=u92AD6cVEXv9NsKHjUnHxBLijwt+xYt+wnWcviPu1yKihq5CHd7graFtmRsnZwl2IX
 lpHgpz/tkHdslnMOMuyleEtXV1VoasPtDwhs8N8lcDPn4q0rOOlCZKklCorOcQAU4Rnd
 0hiPWk8lswU0Li+4CA1Yo6IKZO9EEdFCVvdPrTMA7HrmCPSkKsaBN0xS2RYISXWFjO8a
 UXMhIelPkwQtQA2E95U/zlAQRVzOoj8t6ooiiy+Lrtp28hzNgHo2ddysIOExuUEkH4dp
 o7tmx5DrtZQyLkibBCyrQlV2FrzyE9oNDwLyyJkDWTjrwVvlNEoUedZEWDwztu7CJoR3
 ld/g==
X-Gm-Message-State: AOAM531SvtqEdq7HmOhaBPpXuoBUiGENF1AqECpi4QNEbmm+A6AvZEuP
 vswmzlZ+br4jlZljsw0529v2OS8n0P0PCly+6bNglzhB3K/f7ulJS9RlyIyMSdVRkoLw98kvXm5
 gE5UNBtFgPro73Xw=
X-Received: by 2002:aa7:c905:: with SMTP id b5mr15118162edt.380.1631624419895; 
 Tue, 14 Sep 2021 06:00:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypfWOYgRqaEN3fTIJFIiUbOrv4RXF+qKuog1rg2AoNkeZ4+GkDZdDcZF7DOpRxP4PojcuTxw==
X-Received: by 2002:aa7:c905:: with SMTP id b5mr15118123edt.380.1631624419599; 
 Tue, 14 Sep 2021 06:00:19 -0700 (PDT)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id bj10sm4856610ejb.17.2021.09.14.06.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:00:19 -0700 (PDT)
Date: Tue, 14 Sep 2021 15:00:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: hw/i386/acpi: fix conflicting IO address range for acpi pci
 hotplug in q35
Message-ID: <20210914150018.609b39bd@redhat.com>
In-Reply-To: <20210914045410.3380946-1-ani@anisinha.ca>
References: <20210914045410.3380946-1-ani@anisinha.ca>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sep 2021 10:24:07 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> Hi Igor/Michael :
> 
> This patchset fixes the acpi pci hotplug IO address range conflict issue with cpu hotplug.
> This issue has been reported here:
> https://gitlab.com/qemu-project/qemu/-/issues/561
> 
> We have disucssed this issue at length here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02146.html
> 
> This issue affects Qemu version 6.1.

CCing stable



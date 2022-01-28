Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689E49FCE2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:33:31 +0100 (CET)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTFi-0001Q3-K5
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:33:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDTAZ-0007lg-G9
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:28:14 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:40191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDTAX-0005yN-OF
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=gOQ/7xhEza8RXYoyukmGTzicShKr8QAy8LjvXJp7fJo=; b=lA/SE92BwgmVPG1vklKu5NJICi
 jI5XGHhoHi9Z4nNcTcfWq67Y2DngA+oBNYLZwC0VHaTMboWeyEZmdkbaaJXZpU0NxCj77U1vQFT69
 8VzpwIVCvZ9UoApXMjgtMcePEFkKbcOhyrvdlDJ0OUa+V/PHQbomBBjAczMvJO9X5dtffX5BWcAeE
 SlzItSUuF9mp4thzSvpfTPUIjKgf355xrarUE4B8mRx7v94edjdMoMjuX5GvzWEULrlOOKAxICylu
 WTRqG3QoSlzGAIN98K3kHhI/HQohh1xQplWwFJrayLzLRQrrr4zH+Rf5WpCzgeeM5Y81H1rtYQ5M+
 KEbvIgNN6mYWzo2+2Saf3VDSMgUcDnU1a3faStT8WX/iTRqD4JCVKtcgRBVxYEGKC9y9rI3sKkMfH
 ZH9PR8yccvHdaQjjfN+bFsqEIbdXzCjTGiV1cGkEkc/yFPZNOn3Sh1JLB22KcSJ3Q2P6cRttpHOtN
 IPd9GPFj1wKY2T6nVwnDj8aWQIRSDGE/Vyk35e2fs13UMBg5sg5x9VZp/96Urhup2h4H6ynUlUWwd
 WDL3cv8uwPrxN7fsqbX+wiGZiGVcXOwchUpJDnAxOEMzpR0hX64tf6C2HTy4Xr9jyAOOa31LL1wDz
 1eFYGJKaN1/y0s2c8DLUNgLPmWR9K77axbrow1BF0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 11/11] 9p: darwin: adjust assumption on virtio-9p-test
Date: Fri, 28 Jan 2022 16:28:06 +0100
Message-ID: <3125627.2FGSiGUHTB@silver>
In-Reply-To: <CAB26zV3ej+Bp1M0czmFPTgisdFKKwkOQwQfm+TorUtqyPAjsCw@mail.gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <94e2290b-e31b-15d0-4f44-3c33ffbbfcf1@redhat.com>
 <CAB26zV3ej+Bp1M0czmFPTgisdFKKwkOQwQfm+TorUtqyPAjsCw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Freitag, 28. Januar 2022 14:38:43 CET Will Cohen wrote:
> Apologies! The explanation (and what I'll include in v4) is below:
> 
> The previous test depended on the assumption that P9_DOTL_AT_REMOVEDIR and
> AT_REMOVEDIR have the same value.
> 
> While this is true on Linux, it is not true everywhere, and leads to an
> incorrect test failure on unlink_at, noticed when adding 9p to darwin.

Additionally describing the observed misbehaviour is always useful.

Best regards,
Christian Schoenebeck




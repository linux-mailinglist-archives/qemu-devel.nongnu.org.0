Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C268735EB73
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 05:29:32 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWWDb-0004HK-Td
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 23:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWWCJ-0002vU-Dt; Tue, 13 Apr 2021 23:28:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWWCH-000658-RJ; Tue, 13 Apr 2021 23:28:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id z22so4208501plo.3;
 Tue, 13 Apr 2021 20:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ntkqCo3y8Kq+nq1Hn2nDd/KonO0umjzmBvVSsYNyHY4=;
 b=F0zZq3GZCRuOWJVGXBfZLLdiCeXOKWkpONGJFOK3GTLmd/99x8YQ0DulNJUNhfRyMe
 xfJAsRPGigAdRPKI5ai1q6I6+tjGYJGhkqtmpvK4mWFn01MgFI5yNkOhRvAZLJY/tBEg
 9KF45n9hB0dV/RQ3B1NcmqrDXs/l5DNgc9WvloiHS3NuLjfiPwU6Si3jRph/+OkXLzPx
 vzT+gMPcCkFKIq1jk86gcTQBTgwnYISLGMB10gtc6OvbSOXSQ4qwDedBYEBEMu5IUbLJ
 Aur/3tlBPWgC3ki76EWmC2H0LoRqKGXHmoh+0gasD3xrzbs41Pu+8UmjJJo8xSEhTZ2c
 +nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ntkqCo3y8Kq+nq1Hn2nDd/KonO0umjzmBvVSsYNyHY4=;
 b=oMAp20+I3m+WbAJW+vZ+KZTWvgeVYiHxKPVHUVWEg7t+tuxhuY1KcOcu9gAQDeI9o3
 pTaaq1E2rIcL3WTpuKWAfs4O4fhTxWo2KK1nZfs1ygchaW4j79sCiuzOMHpSJXoRjQ+5
 2jniP3GMvJb1/ro7VW9r6Ic1xHRy8HZmFR10PS0DrBlzNwtKw/lMI/TdiW7a3gj4Www5
 QvQTuGE7G+rO65b5RONJnlCJ64RXyS3yHh4amcogqCvAkVFnBq40s5MfXOedMe4Ztz69
 EPbPmS4/U5gjbXWaE0W6TT4etu4OL64dUFuZ1QlhxAkC4aCqHMSNU+r399O++yFQkTmB
 biHA==
X-Gm-Message-State: AOAM533XGcXlA2U7BFLW10p6U1VtBVfGp+NtL0pMK415B9I+DzJ4Zrz5
 +KEF7cpqk04w84tZT5bOS08=
X-Google-Smtp-Source: ABdhPJwsKF+51FNhEvvf0TSLVcqGz2cj4rFvZssn1Lk7FLmVTcSnpmtgLIniG37ukwuFoScC/JWtPQ==
X-Received: by 2002:a17:902:e5d0:b029:eb:2814:8619 with SMTP id
 u16-20020a170902e5d0b02900eb28148619mr7549485plf.30.1618370888174; 
 Tue, 13 Apr 2021 20:28:08 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id r145sm342713pfc.66.2021.04.13.20.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 20:28:07 -0700 (PDT)
Date: Wed, 14 Apr 2021 13:28:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 3/3] target/ppc: Add POWER10 exception model
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20210413125448.1689545-1-npiggin@gmail.com>
 <20210413125448.1689545-4-npiggin@gmail.com> <87v98q41v0.fsf@linux.ibm.com>
In-Reply-To: <87v98q41v0.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1618370815.qp7u7qeroh.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of April 14, 2021 1:53 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
>> and it removes support for the LPCR[AIL]=3D0b10 mode.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---

[snip]

Thanks for the suggestions, I will consider them if people prefer to go=20
this way rather than the "cleanup first" approach in the RFC I just=20
posted.

Thanks,
Nick


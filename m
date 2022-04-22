Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB850B885
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:32:18 +0200 (CEST)
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtOQ-0000to-AN
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhtKG-0006NW-2o
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:27:58 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhtKE-0000pX-K9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:27:55 -0400
Received: by mail-ej1-x62d.google.com with SMTP id lc2so16346258ejb.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=RUJg+/l8gxWtRsBLdZXA0zihPk0gNzW5+tmFfHG7tz6u9GqnfvwLre+Z0cuM2v87cR
 SpLqRH4WH0Kr8iyGSLT+bLKZc+YQbqFpM/WGce80hZdCWe9pphv14MqZwOfkdeYvS3FP
 WavPBWym9I+KgNk1q6d8fcdTTbRqqdpTmuwMzs+oezzFNSySsCekMMRQ8chJzkTVH0iM
 cdhSJcvO91RqhKgevv/9se1QFLu+Rc3DMe1Gt/rCWNPVsHPOBQuxmxpzGs3CleIcvO1h
 Uf4WF+LzXs7Ki8/KvwQ5yLuRjUoCzFfBtN3tPjQ0vkhSaphLmsSfEj2jeYZ2rxPnv73w
 4GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=jlZSbQu+OvNQj1cGUI40nWIkWMQrPjfHhCaDAtq8BsLXha3abE3f7KSWUzWDW4dSaS
 ZEn5FOkRa/cF+gi+3PHwI5Rd8ww0JMjSKkVyjtCYU77PEclvUygQSFTyfh5H+mnTxOrR
 2GkgwGi+7F0LAbNBCmHVoZDWmL3UL1UJ0dCm/aMTanit9ktD5Lc5cQM6m+i5DOlzlzqZ
 a08Q2+2vBz8CLx4xdFrBDVQK9I/x8g74L4jnhZpCXmgz/COcTwYptkfiVhIudaARntf/
 07V5TMfy19SMjzX5ZsAb2mjKTPr4cJhZIdg+vCuX9Grgp+kr3EiM8cFLwXsU8/UYeVJB
 DKKA==
X-Gm-Message-State: AOAM533AdD6Ke65DWlPLuQkY+GmXyDs24tGDLMTn2TJb1W9RioCVpen+
 PHegnsynJlhLBDc87x1GFS2iue/opV75ig==
X-Google-Smtp-Source: ABdhPJyMZp7tgeF+sM9vFcnZGk3gRztRaa3dUIHjdUOIJOzWbs/ZcS8l5G9jrCj9d5zV+KsU5wcJGQ==
X-Received: by 2002:a17:906:1ecf:b0:6e7:fdc1:255b with SMTP id
 m15-20020a1709061ecf00b006e7fdc1255bmr4129931ejj.340.1650634072859; 
 Fri, 22 Apr 2022 06:27:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b006efc26c7b1dsm725169ejb.195.2022.04.22.06.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 06:27:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH] configure: make fortify_source=yes by default
Date: Fri, 22 Apr 2022 15:27:38 +0200
Message-Id: <20220422132738.55542-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422100825.3692002-1-mjt@msgid.tls.msk.ru>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo




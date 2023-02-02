Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876B3687A28
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:28:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNWoh-00073b-8z; Thu, 02 Feb 2023 05:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNWof-00073O-3t
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:27:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNWod-0000DZ-Lp
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675333659;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rd2cSOhD9JdfHiltVX+SpxT+jQPWRvA+CWcplCIwqZw=;
 b=QEK5G0akBXazfjj5U3tuS2rb9ZSf4gtBRDtrsgiKbGe1HfaSfpuFAkwbYNhoOFAeAqqNm6
 8SLWmAnjRUbEz1Z5+ugPjvxmkoKKkodNngREDQ09mEPr4FvChcby444NNkuhdMkAkcxiLi
 f8GUScFsjSGstU8nBFczlGnuwVUPB50=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-wRT8OFWhNRWbiK86OZj6jA-1; Thu, 02 Feb 2023 05:27:37 -0500
X-MC-Unique: wRT8OFWhNRWbiK86OZj6jA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so721510wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rd2cSOhD9JdfHiltVX+SpxT+jQPWRvA+CWcplCIwqZw=;
 b=SHaxa6w9duq06fRPmDCBdGhzPEoFvnv15N91BqwzAsu4U4hkJAP2xR+9wzKeKncsYl
 cFZmTnftoBPL9iTgSfX5VEhk/mewMmH839iuxVIaX0kLVKBH9Xe3Y1ihg9NIHZuPe2Hh
 ypiTzJo6FsWjXuMSCgVnXMnEcoV01jZhXX2wc0GOyao2gdoXlEfwTBwK46ComXqwWepl
 tkFd6aq6dqpVNmOvNoQ5Fu59RoZZDMF4exai2W9BxHAFOueGngsw/QRmwyij1oAjktAR
 6tPvncQiA56WOZqTlwa398uL+AqSz/JgAJmETZtvQUT9EzIgEAfor+CT6CR7cDlefE6L
 LM8g==
X-Gm-Message-State: AO0yUKUd6bmtZF/sbGVjjZxr65iVAv81YBxSF2foQsBLJM/j9urbeNPY
 wPMEMbCH3RDAd6sf+heB8OJCagZLgnFJ/TKPIjIvTgHb6FD5xbi+MRA89ocI/Fnl2AHNwDHGLrA
 VFAuTYsU10XYeSXY=
X-Received: by 2002:a05:600c:4f8d:b0:3dc:e66:4cb9 with SMTP id
 n13-20020a05600c4f8d00b003dc0e664cb9mr5330347wmq.13.1675333656171; 
 Thu, 02 Feb 2023 02:27:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9rVeSdwUAmSq9dof+P3GbWS6EDklynwMs7853qS/xd7VDB664BMuKGxYO3sWjdjyDDdlPQJA==
X-Received: by 2002:a05:600c:4f8d:b0:3dc:e66:4cb9 with SMTP id
 n13-20020a05600c4f8d00b003dc0e664cb9mr5330335wmq.13.1675333656023; 
 Thu, 02 Feb 2023 02:27:36 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c2e5100b003dd1aa227afsm4001905wmf.31.2023.02.02.02.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:27:35 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  Michal =?utf-8?B?UHLDrXZvem7DrWs=?=
 <mprivozn@redhat.com>,  Daniel P
 . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 2/3] util/userfaultfd: Add uffd_open()
In-Reply-To: <20230201211055.649442-3-peterx@redhat.com> (Peter Xu's message
 of "Wed, 1 Feb 2023 16:10:54 -0500")
References: <20230201211055.649442-1-peterx@redhat.com>
 <20230201211055.649442-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 11:27:34 +0100
Message-ID: <87ilgktl9l.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Add a helper to create the uffd handle.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I can get this one through migration tree.



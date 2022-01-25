Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A933549AFC2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:22:27 +0100 (CET)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCI1y-0003Wb-9x
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:22:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCHw3-0001eH-R9
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:16:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCHvv-0002sx-0a
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643102169;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Th3yPYL9xjm0l1eeNodNnhOOXT63mG+G3Dq6XTF6u/8=;
 b=izid6aMkHzv7hNKup5x+Mlomja6bcfTa9XNQvsu89Ifr2GcsrJnJLKCFS2dWN++aIQzVUr
 cEkcb4AQa7x7zo+j9MBlTuWPqGsX/gNMOnHQAM7SssWWl2cHSM+EaDVLXGi0DLkPx1SRie
 IHnyaqt/v4yyyT9OYQjpbDrYygkzGpM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-XvTS4ulVMx2N9Zx8qMiAtw-1; Tue, 25 Jan 2022 04:16:08 -0500
X-MC-Unique: XvTS4ulVMx2N9Zx8qMiAtw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so953511wme.1
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 01:16:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Th3yPYL9xjm0l1eeNodNnhOOXT63mG+G3Dq6XTF6u/8=;
 b=YaR4IbdtLPapn7mtQs7s4XG9GdXDHwIKw4+vTiI6i6SLsZ1OJTh0VxtNkpdYlkSPyt
 73qH4/qK2G+oEjMuENK6GQOQ4C2L84kxER4jloVlPFSYoGU2pe8b54vCckhwemX8E2hu
 9E6zbKzds0NGw1ZCYSSmLFksJXOAWUx7ZhTnA7UtR5wQ1gHjC6cc3Syc6KeI/yO4iphA
 yJgMHWGZywhGpDk48aQJy/vpIWAGE1V9C4r/7Yz3Gb9H5OcwrQOpRHnY/rwsSqjAodIW
 hVF+9rWFh2Mgt0+fKbA7rj4HnaZqiloMAP5fGkVXkff5E7ZeqlPFDBVqDfG+JICPkxBR
 joBw==
X-Gm-Message-State: AOAM533aa4Kx2cHqvE4ipxl6U9G2VhWolBkqy2FrT0h6WsUXG5KhvOBq
 1zt0vHEEcBOltdHH06YMu92InEqKm4i1ytotLl/QlYbqERVf/CJplZbvFBA+Y+tJb/+Wfiqm3Ms
 bshTEnAQItMemdj4=
X-Received: by 2002:a05:600c:219:: with SMTP id
 25mr2041833wmi.68.1643102167104; 
 Tue, 25 Jan 2022 01:16:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzAEnb9GVn6iTbZMOkef/r6p3sosdBRWd2XnqnMc8uo3WwOQN8E4iN69omKqHIs3ADjavvUA==
X-Received: by 2002:a05:600c:219:: with SMTP id
 25mr2041808wmi.68.1643102166920; 
 Tue, 25 Jan 2022 01:16:06 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id o14sm5350670wry.104.2022.01.25.01.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 01:16:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 3/6] migration: ram_release_pages() always receive 1
 page as argument
In-Reply-To: <174daad7-6153-b85f-32fd-9884052cf03a@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 11 Jan 2022 14:44:27
 +0100")
References: <20220111124556.4892-1-quintela@redhat.com>
 <20220111124556.4892-4-quintela@redhat.com>
 <174daad7-6153-b85f-32fd-9884052cf03a@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 10:16:05 +0100
Message-ID: <8735lctbu2.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> On 1/11/22 13:45, Juan Quintela wrote:
>> Remove the pages argument. And s/pages/page/
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>=20
>> --
>
> Note, you need '---' (3x) to have git tools strip the rest
> (otherwise this text will be committed).

Done, thanks.



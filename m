Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213E43FB73
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 13:34:40 +0200 (CEST)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQ9f-0005zc-Ae
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 07:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ8Q-0004sP-LC
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:33:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ8P-0005Lx-7I
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635507200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHYlD+ksAkG5Pzbb6ZGO7SD3heAOC/VrhkJu1mknqnk=;
 b=B1G90DpVjT82Q7dQfpg3Iy9DKq+YAmG8dQxeURlQhizCs+MQbEkN2ggiSKNivTkmrJAc5c
 m9IEGkYVsgNgxum/OqwnCLuZwAFBrh57imht4sgudB0SIzusn2AgjyUUX3QCXYGHFSWD9V
 Y1HaawPvdy0x4cBQG1tcOKqF9cQYgGk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-UZo6sKHaOSCgzGEc6qjPMg-1; Fri, 29 Oct 2021 07:33:17 -0400
X-MC-Unique: UZo6sKHaOSCgzGEc6qjPMg-1
Received: by mail-wr1-f70.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so3290395wri.11
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 04:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kHYlD+ksAkG5Pzbb6ZGO7SD3heAOC/VrhkJu1mknqnk=;
 b=yxpXmL5vO8F+wVg/oX9rKkBbzLuBEo2FlJTarPEzkCfIh8J3h1fIjN4LqFzH3aQhVB
 ckVr0k50CfL/poAQDVJ3ZezaGvPnora53tZc4egkJbuR6WUCa/sarmxWuIaX1xfUiCrz
 Hq+AnMyAcQNP6F8w8XOQfsiuVLEB7e1pOJ0YOD/GvpcyTuVYiRDqJSizeJqxsCIt2rSz
 bpmbxPbZnvPnnrINswG247oJRD9LmxjQy/1aQreNxiqdEPAWr2/eV4zx7aRsKqwDSFJO
 9b6kFIs+rT3mhJPI+aR1nNNoODLeMRrJlffzWfbEB9F+eEm2pjr2LVxKOFjcxqDDg8E6
 LBUg==
X-Gm-Message-State: AOAM531AvreDzlxWO/HHichAe7w5nkHGkVH9Mw7fA8oRunt5MzpclNdr
 H/4+RJplzGguAB3DhNPuPXrtBtdPaqduPaEyBlzNtOjtB0l2Gjp9s1vKFlbZLk4lmY7hvh2Cduv
 Crymd3LiAhRVfIHs=
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr18831217wmq.154.1635507196316; 
 Fri, 29 Oct 2021 04:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSoaxG6NngwHP8HnoJuJSXzGFScElIj0YsIt6I7J0nrx+25ScFqyxXAgurYHvE/zgwmBchVQ==
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr18831180wmq.154.1635507196114; 
 Fri, 29 Oct 2021 04:33:16 -0700 (PDT)
Received: from [192.168.20.130] (192.red-83-57-30.dynamicip.rima-tde.net.
 [83.57.30.192])
 by smtp.gmail.com with ESMTPSA id w14sm4624440wmi.37.2021.10.29.04.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 04:33:15 -0700 (PDT)
Message-ID: <741557ad-0a8a-1ff4-bc16-278514d0f5e8@redhat.com>
Date: Fri, 29 Oct 2021 13:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/9] qapi: Tools for sets of special feature flags in
 generated code
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-5-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028102520.747396-5-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 12:25, Markus Armbruster wrote:
> New enum QapiSpecialFeature enumerates the special feature flags.
> 
> New helper gen_special_features() returns code to represent a
> collection of special feature flags as a bitset.
> 
> The next few commits will put them to use.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  include/qapi/util.h    | 4 ++++
>  scripts/qapi/gen.py    | 8 ++++++++
>  scripts/qapi/schema.py | 3 +++
>  3 files changed, 15 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



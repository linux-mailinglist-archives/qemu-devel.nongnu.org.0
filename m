Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A83C9F8D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:34:49 +0200 (CEST)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41Vo-0003ET-Hu
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m41Ua-0001pt-2S
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:33:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m41UY-0000Qc-Ih
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626356010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGJ5/859Mtl5rltK6d0hWjXVzwm95TpHpcV2ssGPGRY=;
 b=QMWU4bsXWYaVI9D8Rpp79fnWTtJyb/ev6X3JwBBjL+ti0sadQT6NbxHjb0o5FD79adUasj
 W8aUwf5/YJELWpStAoyaMzM+D3RmVsIVlFTIWCa4abSlKOYD7GFD11Ca0lpAAmZsfva5yr
 oC38+yzxBOVgR8U4PK/unjuUrwVRXzw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-jAoYZGZxOHC5mGEFL-Hesw-1; Thu, 15 Jul 2021 09:33:28 -0400
X-MC-Unique: jAoYZGZxOHC5mGEFL-Hesw-1
Received: by mail-wr1-f72.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so3354585wrc.14
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 06:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gGJ5/859Mtl5rltK6d0hWjXVzwm95TpHpcV2ssGPGRY=;
 b=gxMEtUiE+zJBZI10bqn3e5Nq6qT0665Rl4Bz21JVkcCYzv0OS/w8AiCi4pwqWgGq5U
 MXsn5d4fxPOj2pohj+CvYXfhW/i230axP17xEirvccWwarB3cPRc6XXPbtKUrru1A8cy
 /NkQnUk0nJaBqA0Mkb2z4943jgF8FbJ5YaFK3DWsWVJOiovOKVVbKJrQ0v+aXLLzrgz+
 Y3LEX2UfwiJE6wy5aKw7Xt4zAHUJcUVJK/qqm0vbKaCYv9qAB45BKxUX7qWdlyOF0MBF
 kYfN9AF65MmaTwxCQqFxx/+42StI8VCXrKPfSggS28vfPERCiwD7SpIdfKOpBkQuR1OM
 4jCw==
X-Gm-Message-State: AOAM533TMGHAvJi2p1H2PBADKG6/JCP/E915htXfgaAhe28iA6mMJMFS
 pNOKztElpKY3WqX95uFEMCPCMfMqyq/K2k0NcXwbTUcbSuv8CzmV5+G4gnednVoPcrEXY5OlUK7
 vMFxOpW5DwEm4onagyojM/A9bSRbJDTIWXELS6+306Z5j1y40Hz0jEQw45neVMI3E
X-Received: by 2002:a5d:48c6:: with SMTP id p6mr5679525wrs.45.1626356007762;
 Thu, 15 Jul 2021 06:33:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUw1yLnjqRkeAvT08RFdhcgwZm/IPZEJLtNsMEz4BbtlNceTiOkRxTW4xY6PefgYH1Hg14YQ==
X-Received: by 2002:a5d:48c6:: with SMTP id p6mr5679492wrs.45.1626356007554;
 Thu, 15 Jul 2021 06:33:27 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 d18sm6687984wrw.7.2021.07.15.06.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 06:33:27 -0700 (PDT)
Subject: Re: [PATCH v8 00/16] qemu_iotests: improve debugging options
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210705065711.127119-1-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ba543d5a-8493-ce91-5255-ddfed154124e@redhat.com>
Date: Thu, 15 Jul 2021 15:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705065711.127119-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 08:56, Emanuele Giuseppe Esposito wrote:
> This series adds the option to attach gdbserver and valgrind
> to the QEMU binary running in qemu_iotests.
> It also allows to redirect QEMU binaries output of the python tests
> to the stdout, instead of a log file.
>
> Patches 1-9 introduce the -gdb option to both python and bash tests,
> 10-14 extend the already existing -valgrind flag to work also on
> python tests, and patch 15-16 introduces -p to enable logging to stdout.
>
> In particular, patches 1,6,8,11 focus on extending the QMP socket timers
> when using gdb/valgrind, otherwise the python tests will fail due to
> delays in the QMP responses.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v7:
> * Adjust documentation and error message when -gdb and -valgrind are set
>    at the same time [Eric]
> * Add missing Acked-by [John]

All patches I didn’t comment on:

Reviewed-by: Max Reitz <mreitz@redhat.com>

Which really only leaves the quotes around $GDB_OPTIONS in patch 8.

Max



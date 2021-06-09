Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A774A3A12E9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:39:47 +0200 (CEST)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwYk-0007Wt-5n
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqwWk-0006AS-Gq
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqwWg-0007f7-RH
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623238657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSQUI69usXnG0nDLuHW+OavZdRC2QtPWFPb1wiuGM1E=;
 b=WAjf4hpc/nqqdRk9uc+VpepXirJvul9AjVbSrNVo5dzKF2OG31WdODXHqpZgVzkjIyGmPm
 aUBxiBDlge3/zLARtmitx/LdPr62Q6QQtwUgF/aywtHNtnTp5eZ8pyS3yIo73o8Ut3KC/Z
 1Z0wzWRnP0j8wvPBeEonSNHyTfVo1RM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-DMzqb5n1PYGsw7ZN3S_p_g-1; Wed, 09 Jun 2021 07:37:34 -0400
X-MC-Unique: DMzqb5n1PYGsw7ZN3S_p_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so811703wrq.18
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 04:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aSQUI69usXnG0nDLuHW+OavZdRC2QtPWFPb1wiuGM1E=;
 b=Qe7rn27Y4cng+UnzJ2zSahWQGfnGrPj5rubyZrrKt+I3/7OOBEt7LLO0ej5+j7/lc7
 3Y6e5SXBVT4G+o57f7/IX52a5ZNcz446ZY5VmoDudKUxQ5Nwg4lgBWqsCk6h6jRvhsMq
 P2FLc/mwb1ymUCyNcY9/dYG3s1xuTn2fg+pvHifwZc+6Hw1637XbcT09HK3xgknUua75
 S4aFkFUTqjllowzo7bFSjsPGrwtpegRa3Xxv/KFDH5hYrHK/wQ1d1Cb7rQJoHjP4eOQu
 Cw5gISMXsr+7RsgAH43e8u0cV3QGhWniqB2IXXViVECoQfavGv+DjtvmqLb9FeDD1S9I
 sh0g==
X-Gm-Message-State: AOAM530VT+RomOVl/hNc/0nrIRijTZ/h7o5aOrAC5OdCeTHp8jRvCHIF
 64yHHIfwmkzQnS7n7JdRVXBGFD9cVwSTwlL8vzxP1viMaWE/rcmFMmEuyDsDKcGGa8juB+p6BKQ
 hhOPWvLYUTq8Gdqk=
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr21718400wrx.107.1623238653144; 
 Wed, 09 Jun 2021 04:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIgHRiyCu3YBI7jV3n3YlvJeNDZhpGI7FhqY4AQfwYk7OezC3IaZrAKQbDKh2teeQVPjH6Xw==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr21718379wrx.107.1623238652924; 
 Wed, 09 Jun 2021 04:37:32 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id b135sm6306851wmb.5.2021.06.09.04.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 04:37:32 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] qemu-config: parse configuration files to a QDict
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210524105752.3318299-1-pbonzini@redhat.com>
 <20210524105752.3318299-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7728cf1b-76c8-c39e-4e60-e7f25416d920@redhat.com>
Date: Wed, 9 Jun 2021 13:37:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210524105752.3318299-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 5/24/21 12:57 PM, Paolo Bonzini wrote:
> Change the parser to put the values into a QDict and pass them
> to a callback.  qemu_config_parse's QemuOpts creation is
> itself turned into a callback function.
> 
> This is useful for -readconfig to support keyval-based options;
> getting a QDict from the parser removes a roundtrip from
> QDict to QemuOpts and then back to QDict.
> 
> Unfortunately there is a disadvantage in that semantic errors will
> point to the last line of the group, because the entries of the QDict
> do not have a location attached.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> v1->v2: check for unrecognized entries in the QDict, move a loc_pop for
>         better error messages
> 
> v2->v3->v4: fix error propagation
> 
>  include/qemu/config-file.h |  7 ++-
>  softmmu/vl.c               |  4 +-
>  util/qemu-config.c         | 98 ++++++++++++++++++++++++++------------
>  3 files changed, 76 insertions(+), 33 deletions(-)

> -int qemu_read_config_file(const char *filename, Error **errp)
> +void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp)
> +{
> +    QemuOptsList **lists = opaque;
> +    const char *id = qdict_get_try_str(qdict, "id");
> +    QemuOptsList *list;
> +    QemuOpts *opts;
> +    const QDictEntry *unrecognized;
> +
> +    list = find_list(lists, group, errp);
> +    if (!list) {
> +        return;
> +    }
> +
> +    opts = qemu_opts_create(list, id, 1, errp);
> +    if (!opts) {
> +        return;
> +    }
> +    if (!qemu_opts_absorb_qdict(opts, qdict, errp)) {
> +        return;
> +    }
> +    unrecognized = qdict_first(qdict);
> +    if (unrecognized) {

Using the qemu-qmp.conf from:
https://wiki.qemu.org/Documentation/QMP#By_hand
I'm getting:

qemu-system-i386:qemu-qmp.conf:5: Invalid parameter 'id'

I don't see any "id" in my config. Is it broken? Do we need to
update the wiki?

> +        error_setg(errp, QERR_INVALID_PARAMETER, unrecognized->key);

FYI about QERR_INVALID_PARAMETER in "qapi/qmp/qerror.h":

/*
 * These macros will go away, please don't use in new code, and do not
 * add new ones!
 */

> +        qemu_opts_del(opts);
> +    }
> +}



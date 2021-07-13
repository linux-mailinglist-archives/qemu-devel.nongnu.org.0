Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5DF3C6F29
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 13:10:09 +0200 (CEST)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3GIf-0004wK-Qi
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 07:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3GHf-0004FJ-LF
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3GGg-0004es-3u
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626174481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZAmZllG1gEsZPcOw2uWe82528QrVKqX4oZ3iyoq5fnE=;
 b=RwwD7937cECRcgW7BrBP1slqomTD8fRaE+2vvLrfbXINYrX6yT6EdIQyPiMcR9ZUxMqASI
 ga0fhZ+lOXWcxMTGphDvKAhez9l+f888DT6rcFTt2Kp9IRFvmGL5IMnJSrLEHbw7Z/VQZB
 FEb0OGUn9jf1xtjGPK5GVL7C8Ron11U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-79Yo1uPiMkW6ep0wCkDuqA-1; Tue, 13 Jul 2021 07:07:59 -0400
X-MC-Unique: 79Yo1uPiMkW6ep0wCkDuqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28C4C108C35D;
 Tue, 13 Jul 2021 11:07:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-19.ams2.redhat.com
 [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D66615E26F;
 Tue, 13 Jul 2021 11:07:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 654AD113865F; Tue, 13 Jul 2021 13:07:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 37/40] machine: add smp compound property
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-38-pbonzini@redhat.com>
 <CAFEAcA8JNoPcn8OBw1up0_q-ezw_Dcu4smg3HiiYjJuT8k0-Vg@mail.gmail.com>
Date: Tue, 13 Jul 2021 13:07:25 +0200
In-Reply-To: <CAFEAcA8JNoPcn8OBw1up0_q-ezw_Dcu4smg3HiiYjJuT8k0-Vg@mail.gmail.com>
 (Peter Maydell's message of "Tue, 13 Jul 2021 11:37:27 +0100")
Message-ID: <87czrm5v6a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 6 Jul 2021 at 11:39, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> Make -smp syntactic sugar for a compound property "-machine
>> smp.{cores,threads,cpu,...}".  machine_smp_parse is replaced by the
>> setter for the property.
>>
>> numa-test will now cover the new syntax, while other tests
>> still use -smp.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Hi; Coverity reports a leak in this code (CID 1458085):
>
>> +static void
>> +machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
>> +                           const char *arg, Error **errp)
>> +{
>> +    QDict *opts, *prop;
>> +    bool help = false;
>> +    ERRP_GUARD();
>> +
>> +    prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
>> +    if (help) {
>> +        qemu_opts_print_help(opts_list, true);
>> +        return;
>
> In this return path we don't unref 'prop'.
>
>> +    }

Moreover, when keyval_parse() fails without setting help, we pass an
errp that doesn't point to null to keyval_merge().  Potential crash
bug.

>> +    opts = qdict_new();
>> +    qdict_put(opts, propname, prop);
>> +    keyval_merge(machine_opts_dict, opts, errp);
>> +    qobject_unref(opts);
>> +}

I started to fix this, but got sidetracked into also fixing related
bugs.  Need to finish and and post.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00A602C8D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:12:16 +0200 (CEST)
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okmOE-00023U-8s
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okmDb-0004CR-Mc
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okmDU-0000B8-Pr
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666098067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=svqU6YWAsDxUNYH50HmZ+AdvjhPTkS+/eRUgCg2puzA=;
 b=FEI2ETOiGG8s0FhC09kZU5ItbXfbKorEvrODmWYavOASB7UA6dhi6uQUdYHX7bGWYZNc4M
 9UKQzlSCes9oTDQ4E4iE/F8ggmQPLFDoqcJ4faTMWgirr8oJbletNHAAR5kZSx0MF8ISPB
 Ta2S7Mvk1ARDZu866Ue2TeaLZlWxAGY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-kIp6rra0NYqnlbZzzdu2fQ-1; Tue, 18 Oct 2022 09:01:04 -0400
X-MC-Unique: kIp6rra0NYqnlbZzzdu2fQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82ED829AA38B;
 Tue, 18 Oct 2022 13:01:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F9DE404787;
 Tue, 18 Oct 2022 13:01:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6366521E6936; Tue, 18 Oct 2022 15:01:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  jsnow@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH v2 15/28] qapi misc: Elide redundant has_FOO in generated C
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-16-armbru@redhat.com>
 <Y06AwNtiM1+bEKNo@work-vm> <87v8ohl74q.fsf@pond.sub.org>
 <Y06LNeMvgOmqtl54@work-vm>
Date: Tue, 18 Oct 2022 15:01:03 +0200
In-Reply-To: <Y06LNeMvgOmqtl54@work-vm> (David Alan Gilbert's message of "Tue, 
 18 Oct 2022 12:17:09 +0100")
Message-ID: <87lepd2smo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>> 
>> > * Markus Armbruster (armbru@redhat.com) wrote:
>> >> The has_FOO for pointer-valued FOO are redundant, except for arrays.
>> >> They are also a nuisance to work with.  Recent commit "qapi: Start to
>> >> elide redundant has_FOO in generated C" provided the means to elide
>> >> them step by step.  This is the step for qapi/misc.json.
>> >> 
>> >> Said commit explains the transformation in more detail.  The invariant
>> >> violations mentioned there do not occur here.
>> >> 
>> >> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]

>> >> diff --git a/util/qemu-config.c b/util/qemu-config.c
>> >> index 5325f6bf80..95f61fc883 100644
>> >> --- a/util/qemu-config.c
>> >> +++ b/util/qemu-config.c
>> >> @@ -80,14 +80,8 @@ static CommandLineParameterInfoList *query_option_descs(const QemuOptDesc *desc)
>> >>              break;
>> >>          }
>> >>  
>> >> -        if (desc[i].help) {
>> >> -            info->has_help = true;
>> >> -            info->help = g_strdup(desc[i].help);
>> >> -        }
>> >> -        if (desc[i].def_value_str) {
>> >> -            info->has_q_default = true;
>> >> -            info->q_default = g_strdup(desc[i].def_value_str);
>> >> -        }
>> >> +        info->help = g_strdup(desc[i].help);
>> >> +        info->q_default = g_strdup(desc[i].def_value_str);
>> >>  
>> >>          QAPI_LIST_PREPEND(param_list, info);
>> >>      }
>> >> @@ -245,8 +239,7 @@ static QemuOptsList machine_opts = {
>> >>      }
>> >>  };
>> >>  
>> >> -CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>> >> -                                                          const char *option,
>> >> +CommandLineOptionInfoList *qmp_query_command_line_options(const char *option,
>> >>                                                            Error **errp)
>> >>  {
>> >>      CommandLineOptionInfoList *conf_list = NULL;
>> >> @@ -254,7 +247,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>> >>      int i;
>> >>  
>> >>      for (i = 0; vm_config_groups[i] != NULL; i++) {
>> >> -        if (!has_option || !strcmp(option, vm_config_groups[i]->name)) {
>> >> +        if (!option || !strcmp(option, vm_config_groups[i]->name)) {
>> >
>> > I think that can be g_strcmp0 if you can convince yourself ->name is
>> > non-null
>> 
>> vm_config_groups[i] must not be null.
>> 
>> However, replacing the whole condition by !g_strcmp0() would be wrong:
>> 
>>     option                             |  null   ->name  neither
>>     -----------------------------------+------------------------
>>     !option || !strcmp(option, ->name) |  true     true    false
>>     g_strcmp0(option, ->name)          | false     true    false
>
> Oops yes, sorry these are the other way around as you point out.

I fell into the exact same trap myself :)

[...]



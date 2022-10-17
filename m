Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8E60151F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 19:26:26 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okTsf-0007ut-Mk
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 13:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okTqX-0004cD-Ct
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okTqV-0000gt-C2
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666027449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HATbjU/XYE4IneDBHINVClwelNg07XxeOl/ThLUbAKc=;
 b=ddvLnIgsYaS3cOOyuNhTDX1+/lqhELO0gZduxDu22IEWn2CHa2ECAsQYguHQ37MRKCI7L/
 OWNy0gUNXCgv/AqZ83UIF1qiId24x9/1GSks86/Nm4zRaGCVWo+tysD8QsHRi1cM1E+C9i
 9lNwsTXBCGJ64bDI19aQtwTEAVCWWj8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-d7MnxJY6NF-xaltE5xvazw-1; Mon, 17 Oct 2022 13:24:05 -0400
X-MC-Unique: d7MnxJY6NF-xaltE5xvazw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B26923C30527;
 Mon, 17 Oct 2022 17:24:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D25F9401BC6A;
 Mon, 17 Oct 2022 17:23:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 55DD121E691D; Mon, 17 Oct 2022 19:23:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,  michael.roth@amd.com,
 vsementsov@yandex-team.ru,  marcandre.lureau@gmail.com
Subject: Re: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
References: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
 <87tu47vkdx.fsf@pond.sub.org> <Y0gxfqMXi3gLH/3H@redhat.com>
 <8735bqu4ym.fsf@pond.sub.org> <Y0lIfTS4/5UMItkk@redhat.com>
 <87zgdypnq5.fsf@pond.sub.org> <Y0lhzBo8fx1ptEfn@redhat.com>
 <a2ff7f2d-1655-19fa-8cad-baf9fe65a4fe@yandex-team.ru>
Date: Mon, 17 Oct 2022 19:23:50 +0200
In-Reply-To: <a2ff7f2d-1655-19fa-8cad-baf9fe65a4fe@yandex-team.ru> (Denis
 Plotnikov's message of "Sun, 16 Oct 2022 12:25:48 +0300")
Message-ID: <871qr6qs7t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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

Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:

> On 14.10.2022 16:19, Daniel P. Berrang=C3=A9 wrote:
>> On Fri, Oct 14, 2022 at 02:57:06PM +0200, Markus Armbruster wrote:
>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>>
>>>> On Fri, Oct 14, 2022 at 11:31:13AM +0200, Markus Armbruster wrote:
>>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>>>>
>>>>>> On Thu, Oct 13, 2022 at 05:00:26PM +0200, Markus Armbruster wrote:
>>>>>>> Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:
>>>>>>>
>>>>>>>> Add "start" & "end" time values to qmp command responses.
>>>>>>> Please spell it QMP.  More of the same below.
>>>>>>>
>>>>>>>> These time values are added to let the qemu management layer get t=
he exact
>>>>>>>> command execution time without any other time variance which might=
 be brought by
>>>>>>>> other parts of management layer or qemu internals. This is particu=
lary useful
>>>>>>>> for the management layer logging for later problems resolving.
>>>>>>> I'm still having difficulties seeing the value add over existing
>>>>>>> tracepoints and logging.
>>>>>>>
>>>>>>> Can you tell me about a problem you cracked (or could have cracked)=
 with
>>>>>>> the help of this?
>>>>>> Consider your QMP client is logging all commands and replies in its
>>>>>> own logfile (libvirt can do this). Having this start/end timestamps
>>>>>> included means the QMP client log is self contained.
>>>>> A QMP client can include client-side timestamps in its log.  What val=
ue
>>>>> is being added by server-side timestamps?  According to the commit
>>>>> message, it's for getting "the exact command execution time without a=
ny
>>>>> other time variance which might be brought by other parts of manageme=
nt
>>>>> layer or qemu internals."  Why is that useful?  In particular, why is
>>>>> excluding network and QEMU queueing delays (inbound and outbound)
>>>>> useful?
>>>> Lets, say some commands normally runs in ~100ms, but occasionally
>>>> runs in 2secs, and you want to understand why.
>>>>
>>>> A first step is understanding whether a given command itself is
>>>> slow at executing, or whether its execution has merely been
>>>> delayed because some other aspect of QEMU has delayed its execution.
>>>> If the server timestamps show it was very fast, then that indicates
>>>> delayed processing. Thus instead of debugging the slow command, I
>>>> can think about what scenarios would be responsible for the delay.
>>>> Perhaps a previous QMP command was very slow, or maybe there is
>>>> simply a large volume of QMP commands backlogged, or some part of
>>>> QEMU got blocked.
>>>>
>>>> Another case would be a command that is normally fast, and sometimes
>>>> is slower, but still relatively fast. The network and queueing side
>>>> might be a significant enough proportion of the total time to obscure
>>>> the slowdown. If you can eliminate the non-execution time, you can
>>>> see the performance trends over time to spot the subtle slowdowns
>>>> and detect abnormal behaviour before it becomes too terrible.
>>> This is troubleshooting.  Asking for better troubleshooting tools is
>>> fair.
>>>
>>> However, the proposed timestamps provide much more limited insight than
>>> existing tracepoints.  For instance, enabling
>> tracepoints are absolutely great and let you get a hell of alot
>> more information, *provided* you are in a position to actually
>> use tracepoints. This is, unfortunately, frequently not the case
>> when supporting real world production deployments.
>
> Exactly!!! Thanks for the pointing out!
>>
>> Bug reports from customers typically include little more than a
>> log file they got from the mgmt client at time the problem happened.
>> The problem experianced may no longer exist, so asking them to run
>> a tracepoint script is not possible. They may also be reluctant to
>> actually run tracepoint scripts on a production system, or simply
>> lack the ability todo so at all, due to constraints of the deployment
>> environment. Logs from libvirt are something that are collected by
>> default for many mgmt apps, or can be turned on by the user with
>> minimal risk of disruption.
>>
>> Overall, there's a compelling desire to be proactive in collecting
>> information ahead of time, that might be useful in diagnosing
>> future bug reports.
>
> This is the main reason. When you encounter a problem one of the first
> questions is "Was there something similar in the past. Another question
> is how often does it happen.
>
> With the timestamps these questions answering becomes easier.
>
> Another thing is that with the qmp command timestamps you can build a
> monitoring system which will report about the cases when
> execution_time_from_mgmt_perspective - excution_time_qmp_command >
> some_threshold which in turn proactively tell you about the potential
> problems. And then you'll start using the qmp tracepoints (and other
> means) to figure out the real reason of the execution time variance.
>
> Thanks, Denis
>
>>
>> So it isn't an 'either / or' decision of QMP reply logs vs use of
>> tracepoints, both are beneficial, with their own pros/cons.
>>
>> With regards,
>> Daniel

Please give full rationale in the commit message.  Make sure to address
the following points:

1. Why tracepoints can't do the job

2. Why client-side logging can't do the job

3. Why of all the possible points of interest in a QMP command's flow
   through QEMU, you're picking these two.

So far, I've seen a full argument on 1., not much on 2., and basically
nothing on 3.



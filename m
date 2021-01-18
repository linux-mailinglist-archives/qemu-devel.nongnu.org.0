Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D52F9A85
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:30:27 +0100 (CET)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Oza-0007NW-CC
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1l1OxF-0006cu-RM
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:28:01 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1l1OxC-0002kI-BZ
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:28:01 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DK3Hb5fJqzl6P2;
 Mon, 18 Jan 2021 15:26:19 +0800 (CST)
Received: from [10.174.186.85] (10.174.186.85) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 18 Jan 2021 15:27:33 +0800
Subject: Re: [PATCH v2 2/2] vnc: add qmp to support reload vnc tls certificates
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
References: <20210107143032.752-1-changzihao1@huawei.com>
 <20210107143032.752-3-changzihao1@huawei.com>
 <87turil3s2.fsf@dusky.pond.sub.org> <20210115134710.GH1692978@redhat.com>
From: Zihao Chang <changzihao1@huawei.com>
Message-ID: <64ce816e-017f-1613-9001-a8cd968a9ec9@huawei.com>
Date: Mon, 18 Jan 2021 15:27:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210115134710.GH1692978@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=changzihao1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/1/15 21:47, Daniel P. Berrangé wrote:
> On Fri, Jan 15, 2021 at 02:37:33PM +0100, Markus Armbruster wrote:
>> Zihao Chang <changzihao1@huawei.com> writes:
>>
>>> QEMU loads vnc tls certificates only when vm is started. This patch
>>> provides a new qmp to reload vnc tls certificates without restart
>>> vnc-server/VM.
>>> {"execute": "reload-vnc-cert"}
>>>
>>> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
>>> ---
>>>  include/ui/console.h |  1 +
>>>  monitor/qmp-cmds.c   |  5 +++++
>>>  qapi/ui.json         | 18 ++++++++++++++++++
>>>  ui/vnc.c             | 24 ++++++++++++++++++++++++
>>>  4 files changed, 48 insertions(+)
>>>
>>> diff --git a/include/ui/console.h b/include/ui/console.h
>>> index 5dd21976a3..60a24a8bb5 100644
>>> --- a/include/ui/console.h
>>> +++ b/include/ui/console.h
>>> @@ -441,6 +441,7 @@ int vnc_display_password(const char *id, const char *password);
>>>  int vnc_display_pw_expire(const char *id, time_t expires);
>>>  QemuOpts *vnc_parse(const char *str, Error **errp);
>>>  int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
>>> +void vnc_display_reload_cert(const char *id,  Error **errp);
>>
>> Make this return bool, please.
>>
I will fix this in the next version.
Thank your for your reviews.

>> error.h's big comment:
>>
>>  * = Rules =
>>  *
>>  * - Functions that use Error to report errors have an Error **errp
>>  *   parameter.  It should be the last parameter, except for functions
>>  *   taking variable arguments.
>>  *
>>  * - You may pass NULL to not receive the error, &error_abort to abort
>>  *   on error, &error_fatal to exit(1) on error, or a pointer to a
>>  *   variable containing NULL to receive the error.
>>  *
>>  * - Separation of concerns: the function is responsible for detecting
>>  *   errors and failing cleanly; handling the error is its caller's
>>  *   job.  Since the value of @errp is about handling the error, the
>>  *   function should not examine it.
>>  *
>>  * - The function may pass @errp to functions it calls to pass on
>>  *   their errors to its caller.  If it dereferences @errp to check
>>  *   for errors, it must use ERRP_GUARD().
>>  *
>>  * - On success, the function should not touch *errp.  On failure, it
>>  *   should set a new error, e.g. with error_setg(errp, ...), or
>>  *   propagate an existing one, e.g. with error_propagate(errp, ...).
>>  *
>>  * - Whenever practical, also return a value that indicates success /
>>  *   failure.  This can make the error checking more concise, and can
>>  *   avoid useless error object creation and destruction.  Note that
>>  *   we still have many functions returning void.  We recommend
>>  *   • bool-valued functions return true on success / false on failure,
>>  *   • pointer-valued functions return non-null / null pointer, and
>>  *   • integer-valued functions return non-negative / negative.
>>
>>>  
>>>  /* input.c */
>>>  int index_from_key(const char *key, size_t key_length);
>>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>>> index 34f7e75b7b..84f2b74ea8 100644
>>> --- a/monitor/qmp-cmds.c
>>> +++ b/monitor/qmp-cmds.c
>>> @@ -287,6 +287,11 @@ static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
>>>          qmp_change_vnc_listen(target, errp);
>>>      }
>>>  }
>>> +
>>> +void qmp_reload_vnc_cert(Error **errp)
>>> +{
>>> +    vnc_display_reload_cert(NULL, errp);
>>> +}
>>>  #endif /* !CONFIG_VNC */
>>>  
>>>  void qmp_change(const char *device, const char *target,
>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>> index d08d72b439..855b1ac007 100644
>>> --- a/qapi/ui.json
>>> +++ b/qapi/ui.json
>>> @@ -1179,3 +1179,21 @@
>>>  ##
>>>  { 'command': 'query-display-options',
>>>    'returns': 'DisplayOptions' }
>>> +
>>> +##
>>> +# @reload-vnc-cert:
>>> +#
>>> +# Reload certificates for vnc.
>>> +#
>>> +# Returns: nothing
>>> +#
>>> +# Since: 5.2
>>
>> 6.0 now.
>>
>>> +#
>>> +# Example:
>>> +#
>>> +# -> { "execute": "reload-vnc-cert" }
>>> +# <- { "return": {} }
>>> +#
>>> +##
>>> +{ 'command': 'reload-vnc-cert',
>>> +  'if': 'defined(CONFIG_VNC)' }
>>
>> Daniel's objection to another patch that adds a rather specialized QMP
>> command may apply: "I'm not a fan of adding adhoc new commands for
>> specific properties."
>>
>>     From: Daniel P. Berrangé <berrange@redhat.com>
>>     Subject: Re: [PATCH] vnc: add qmp to support change authz
>>     Message-ID: <20210107161830.GE1029501@redhat.com>
> 
> Yeah, though this scenario is a ittle more complicated. Tihs patch is
> not actually changing any object properties in the VNC server config.
> It is simply telling the VNC server to reload the existing object it
> has configured.
> 
> My proposed  "display-update" command would not directly map to what
> this "reload-vnc-cert" command does, unless we declared the certs are
> always reloaded after every display-update command.
> 
> Or we could have a more generic  "display-reload" command, which has
> fields indicating what aspect to reload. eg a 'tls-certs: bool' field
> to indicate reload of TLS certs in the display. This could be useful
> if we wanted the ability to reload authz access control lists, though
> we did actually wire them up to auto-reload using inotify.
> 
> 
> Regards,
> Daniel
> 

If we add field for each reloadable attribute(tls-certs, authz,...),
the number of parameters for qmp_display_reload() may increase sharply
(bool has_tls_certs, bool tls_certs, ... twice the number of attributes).

How about using a list[] to determine which attributes need to be
reloaded["tls_certs", "authz*"...], and define an enum to ensure the
validity of list elements.


Regards,
Zihao


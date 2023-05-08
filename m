Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD736FA897
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:43:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvyJi-0007Kt-11; Mon, 08 May 2023 06:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pvyJe-0007KJ-Kf
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pvyJc-0006vL-5V
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683542518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LIYBIkTHNNjFc+iUIjqc65OBuYXg5G+l6Yhd6pAW7V0=;
 b=L3hcxlcyLuB67NGjs1MkojwZPSaJUeVwdHnZM4QesU3M2uwXUQd14sr0i0WMBEo3iqFwhy
 FUqPjwFson+W1N5AcBJCpNrPdzgvVyxMtatxK3hA+xz9MgbiY9jO2d/Y34LibDKKp3e/Dw
 pKQTy93+U6+JyRee4YNEJxsQLspmip0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-3KKgaASpMrGhC1eIt3v_2g-1; Mon, 08 May 2023 06:41:57 -0400
X-MC-Unique: 3KKgaASpMrGhC1eIt3v_2g-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50bd07fbd97so5047375a12.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 03:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683542515; x=1686134515;
 h=in-reply-to:subject:from:references:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LIYBIkTHNNjFc+iUIjqc65OBuYXg5G+l6Yhd6pAW7V0=;
 b=aLD2HEuzO3m98zPzvacVMfpkMNA5SE58+oDR7jueOyWlyWqFUc/VG82ga8vtFbyaIH
 3iQoxwqKUWW57+Mq+gZaWNJYIpdyd7sv16iuwhY16mNXTEpNA3YaEDVpaIzJDrWxMcfv
 +HWJRmVSRgMeVV2QNedjEamrrqPcBtVIY9kYcuU9o9fltcnTa3dtwCVHQGgv0XPSdYXI
 pHtHOu4Aq4Vcqnd73lRJ+MbqoaPgk5h37AG0Qbznx97LM//MG+gDizTBwOsLg4V6Y8gR
 uPxaYhfPLS1pNHxF1Y/i3owNkoV2J7xyx6wSYye2mqVp7IlomozVPSx+4z2YiMrhffxj
 yOCA==
X-Gm-Message-State: AC+VfDx8t69JHoMXkwVpA0HCuF2zJQ/rrbycX5Y9you/nhtQWcCKHI3k
 TSKAzEJyyqYAUYY3Vgfo047XZtsGsPQcdVHjlTCAwLG973ttwHdQnnET7EfWBb0ak7zASizT5J1
 R/Qdn4l8Y/BXP0sq7NjkAJuc=
X-Received: by 2002:a05:6402:5142:b0:4fd:c5e:79b8 with SMTP id
 n2-20020a056402514200b004fd0c5e79b8mr7983945edd.32.1683542515477; 
 Mon, 08 May 2023 03:41:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6zhGrmZP3ONwHGkCe2cb4XB0VcVYpH315jDE1mPfxca0jEInEImrSV9E13J/0SI23bpnwX/w==
X-Received: by 2002:a05:6402:5142:b0:4fd:c5e:79b8 with SMTP id
 n2-20020a056402514200b004fd0c5e79b8mr7983928edd.32.1683542514994; 
 Mon, 08 May 2023 03:41:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 k7-20020aa7c047000000b0050cc4461fc5sm3540258edo.92.2023.05.08.03.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:41:53 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------yeRmNb8vGPYXeD4iyzAyNQd6"
Message-ID: <70100e22-6d7d-bb84-b2ed-e64d7929d2c5@redhat.com>
Date: Mon, 8 May 2023 12:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <87v8h3mdef.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: How can I find problematic uses of error_report() with vrc?
In-Reply-To: <87v8h3mdef.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------yeRmNb8vGPYXeD4iyzAyNQd6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/23 10:32, Markus Armbruster wrote:
> 1. Find functions using Error
> 
>     Doesn't have to be perfect.  I have a simple Coccinelle script
>     (appended) that spits out some 4400 functions.  I run it like
> 
>      $ spatch --sp-file find-error-fns.cocci --macro-file scripts/cocci-macro-file.h `git-grep -Fl 'Error **' \*.[ch]`

Nice.  For the following tests I just did a "grep 'Error \*\*' include" 
and massaged it into a list, so I have substantially less information, 
but it was enough to find _something_.

> 2. Find call chains from these functions to error_report()
> 
>     I'm hoping vrc can do that for me.  How?

The good news is that's relatively easy.  The bad news is that there are 
so many possible call chains that you'll often find _other_ refactorings 
to do first (typically very coccinelle-friendly stuff, as you will see).

Anyhow, let's start with vrc being already installed ("pip install ." is 
enough from a vrc checkout; right now it's tested with libclang 15) and 
a QEMU build directory where qemu-system-x86_64 has been built.  Because 
QEMU is huge and most opportunities are in common code, using a single 
binary is easiest.

The attached "errorpp" file is my own small list of ~200 functions using 
"Error **".  It adds to them a "label" called ErrorPP.  Labels can be 
added manually or with __attribute__(annotate("label")).

Let's build vrc and run it from the QEMU build directory

$ meson setup +build
$ ninja -C+build
[17/17] Linking target vrc/cython_graph.cpython-311-x86_64-linux-gnu.so
$ meson devenv -C+build
$ cd ~/work/upstream/qemu/+build
$ python -m vrc
Loading compile_commands.json
(vrc) load */*.c.o
(vrc) source errorpp

I've seen occasional segfaults here on larger machines and I haven't yet 
confirmed why they happen.  This BTW was the main reason why I haven't 
published vrc more widely, but now you're forcing my hand.  Give me an 
hour or two and I will push the tentative fix to github. ;)

Most of this email is a story of false positives.  If you want to see a 
little good stuff, search for "[here]".  Because finding all paths is 
not doable, so let's start by finding all functions that may end up 
calling error_report.  Here's our first query:

(vrc) paths [ErrorPP,"error_report":all_callers]

Pretty legible IMNSHO, but to be clear:

- Inside brackets, bare words are "labels" and function names are 
quoted.  Outside brackets, function names can but need not be quoted. 
Seems weird but it's pretty handy actually.

- The colon starts a modifier, which is like a postfix operator applied 
to what comes before it.  "all_callers" means to walk recursively up 
from error_report.

- The comma is an AND, so the printed functions are marked ErrorPP and 
able to reach all_callers.

The output is pretty long, but "socket_listen" jumped to me as something 
that should not have this issue.

(vrc) paths --limit 1 socket_listen [!ErrorPP]* error_report
error_report <- replay_write_error <- ... <- aio_poll <- bdrv_poll_co <- 
bdrv_debug_event <- qcow2_co_save_vmstate <- ... error_vreport <- 
error_exit <- qemu_mutex_unlock_impl <- monitor_cur <- socket_get_fd <- 
socket_listen

Here we start seeing the problem: there are many functions with an error 
path that ultimately leads to error_report in very roundabout ways.

error_exit is okay-ish, as it's more like an assertion failure, so let's 
prune it; I expect other calls to error_report to come from 
record-replay, so I'm cutting away that path as well using a regular 
expression.

(vrc) omit error_exit replay_write_error /^replay_/

Note that the arguments to "omit" can use the full syntax that was used 
above in "paths".  You can see why it's handy to omit quotes outside 
brackets even if it makes the syntax a bit less orthogonal.

(vrc) paths --limit 1 socket_listen [!ErrorPP]* error_report
<no output>

Cool, those were all false positives.

Let's run the original query again and try another one

(vrc) paths [ErrorPP,"error_report":all_callers]
(vrc) paths --limit 1 qemu_ram_resize [!ErrorPP]* error_report
error_report <- icount_get_raw_locked <- icount_get_raw <- 
qemu_clock_get_ns <- qemu_clock_get_ms <- mux_chr_write <- 
ChardevClass::chr_write <- qemu_chr_write_buffer <- qemu_chr_write <- 
qemu_chr_fe_write <- monitor_flush_locked <- monitor_puts <- 
monitor_vprintf <- error_vprintf <- vreport <- error_report_once_cond <- 
kvm_log_clear <- MemoryListener::log_clear <- 
memory_region_clear_dirty_bitmap <- 
cpu_physical_memory_test_and_clear_dirty <- 
cpu_physical_memory_clear_dirty_range <- qemu_ram_resize

Ok, once we're in "vreport" any nested calls are kinda irrelevant. 
Other functions that we can filter out are "error_printf" (called from 
warn_report_err) and error_propagate (which can call error_report when 
called with &error_fatal and friends)

(vrc) omit vreport error_printf error_propagate
(vrc) paths --limit 1 qemu_ram_resize [!ErrorPP]* error_report
error_report <- kvm_log_clear_one_slot <- kvm_physical_log_clear <- 
kvm_log_clear <- MemoryListener::log_clear <- 
memory_region_clear_dirty_bitmap <- 
cpu_physical_memory_test_and_clear_dirty <- 
cpu_physical_memory_clear_dirty_range <- qemu_ram_resize

Hrm, this should probably be a warn_report.  Probably applies to most 
cases were "error_report" isn't followed by a return/goto/exit.  First 
example of a refactoring _other_ than the one you were looking for. 
Let's hide this one and, to keep the email short, the next one:

(vrc) omit kvm_log_clear_one_slot kvm_flush_coalesced_mmio_buffer
(vrc) paths --limit 1 qemu_ram_resize [!ErrorPP]* error_report
error_report <- type_initialize <- object_class_get_parent <- 
object_property_iter_next <- object_property_del_all <- object_finalize 
<- object_unref <- memory_region_unref <- flatview_simplify <- 
generate_memory_topology <- flatviews_init <- flatviews_reset <- 
memory_region_transaction_commit <- memory_region_set_size <- 
qemu_ram_resize

Another issue: error_report used before exit() or abort() is _also_ a 
kind of assertion failure, similar to error_exit().  A similar issue 
occurs in object_initialize, object_dynamic_cast_assert, 
object_class_dynamic_class_assert.

(vrc) omit type_initialize object_initialize object_dynamic_cast_assert 
object_class_dynamic_class_assert
(vrc) paths --limit 1 qemu_ram_resize [!ErrorPP]* error_report
error_report <- icount_get_raw_locked <- icount_get_raw <- 
qemu_clock_get_ns <- timerlist_deadline_ns <- timerlistgroup_deadline_ns 
<- aio_compute_timeout <- aio_poll <- bdrv_poll_co <- bdrv_flush <- 
qio_channel_block_close <- QIOChannelClass::io_close <- 
qio_channel_close <- qio_net_listener_disconnect <- 
qio_net_listener_finalize <- TypeInfo::instance_finalize <- 
TypeImpl::instance_finalize <- object_deinit <- object_finalize <- 
object_unref <- qdev_init_clocklist <- qdev_init_clock_in <- 
systick_instance_init <- TypeInfo::instance_init <- 
TypeImpl::instance_init <- object_init_with_type <- 
object_initialize_with_type <- object_new_with_type <- object_new <- 
container_get <- memory_region_do_init <- memory_region_init <- 
memory_region_init_io <- subpage_init <- register_subpage <- 
flatview_add_to_dispatch <- generate_memory_topology <- flatviews_init 
<- flatviews_reset <- memory_region_transaction_commit <- 
memory_region_set_size <- qemu_ram_resize

Ouch, this is getting... a bit specific.  Let's just cut out function 
pointers for simplicity:

(vrc) paths --limit 1 qemu_ram_resize [!ErrorPP,function_pointer]* 
error_report
<no output>

Okay, so this one was a false positive as well.

So you can see the good and the bad here.  The tool is powerful and 
finds what you asked.  The problem is that there's _a lot_ of hay in 
which you have to find the needle.  For coroutines it works bettr 
because we have already cleaned it up, you can get there but it takes 
some sweat.

[here]

Let's try a more precise (but also more restrictive) query that only has 
a single function that does not take Error** but calls error_report:

(vrc) paths [ErrorPP] [ErrorPP]* [!ErrorPP] error_report
error_report <- qemu_open_old <- qmp_chardev_open_file_source
error_report <- runstate_set <- qemu_system_wakeup_request
error_report <- machine_consume_memdev <- machine_run_board_init
error_report <- numa_complete_configuration <- machine_run_board_init
error_report <- egl_rendernode_init <- egl_init
error_report <- parse_numa_node <- set_numa_options

I checked parse_numa_node and numa_complete_configuration, and they're 
genuine issues.

Let's add a couple labels by hand to see if it finds your example:

(vrc) label ErrorPP qmp_migrate rdma_start_outgoing_migration 
qemu_rdma_source_init
(vrc) paths qmp_migrate [ErrorPP]* [!ErrorPP] error_report
error_report <- migrate_fd_connect <- rdma_start_outgoing_migration <- 
qmp_migrate
error_report <- qemu_rdma_cleanup <- rdma_start_outgoing_migration <- 
qmp_migrate
error_report <- qemu_rdma_resolve_host <- qemu_rdma_source_init <- 
rdma_start_outgoing_migration <- qmp_migrate
error_report <- qemu_rdma_alloc_pd_cq <- qemu_rdma_source_init <- 
rdma_start_outgoing_migration <- qmp_migrate
error_report <- qemu_rdma_cleanup <- qemu_rdma_source_init <- 
rdma_start_outgoing_migration <- qmp_migrate
error_report <- qemu_rdma_reg_control <- qemu_rdma_source_init <- 
rdma_start_outgoing_migration <- qmp_migrate
error_report <- qemu_rdma_connect <- rdma_start_outgoing_migration <- 
qmp_migrate

Mission accomplished. :)

Paolo

> Here's my find-error-fns.cocci:
> 
> @r@
> identifier fn, errp;
> position p;
> @@
>   fn@p(..., Error **errp, ...)
>   {
>       ...
>   }
> @script:python@
> fn << r.fn;
> p << r.p;
> @@
> print(f'{p[0].file}:{p[0].line}:{p[0].column}:{fn}')
> 

--------------yeRmNb8vGPYXeD4iyzAyNQd6
Content-Type: text/plain; charset=UTF-8; name="errorpp"
Content-Disposition: attachment; filename="errorpp"
Content-Transfer-Encoding: base64

bGFiZWwgRXJyb3JQUCBhaW9fc2V0dXBfbGludXhfYWlvCmxhYmVsIEVycm9yUFAgYWlvX3Nl
dHVwX2xpbnV4X2lvX3VyaW5nCmxhYmVsIEVycm9yUFAgYmRydl9jb19jcmVhdGVfZmlsZQps
YWJlbCBFcnJvclBQIGJkcnZfZHJvcF9maWx0ZXIKbGFiZWwgRXJyb3JQUCBiZHJ2X29wZW5f
YmxvY2tkZXZfcmVmCmxhYmVsIEVycm9yUFAgYmRydl9jb19vcGVuX2Jsb2NrZGV2X3JlZgps
YWJlbCBFcnJvclBQIGJkcnZfcmVvcGVuX211bHRpcGxlCmxhYmVsIEVycm9yUFAgYmRydl9y
ZWZyZXNoX2xpbWl0cwpsYWJlbCBFcnJvclBQIGJkcnZfbWFrZV9lbXB0eQpsYWJlbCBFcnJv
clBQIGJkcnZfYWN0aXZhdGUKbGFiZWwgRXJyb3JQUCBiZHJ2X2NvX2FjdGl2YXRlCmxhYmVs
IEVycm9yUFAgYmRydl9hY3RpdmF0ZV9hbGwKbGFiZWwgRXJyb3JQUCBiZHJ2X2dldF9mdWxs
X2JhY2tpbmdfZmlsZW5hbWUKbGFiZWwgRXJyb3JQUCBiZHJ2X2Rpcm5hbWUKbGFiZWwgRXJy
b3JQUCBiZHJ2X29wX2lzX2Jsb2NrZWQKbGFiZWwgRXJyb3JQUCBiZHJ2X29wX2Jsb2NrCmxh
YmVsIEVycm9yUFAgYmRydl9vcF91bmJsb2NrCmxhYmVsIEVycm9yUFAgYmRydl9vcF9ibG9j
a19hbGwKbGFiZWwgRXJyb3JQUCBiZHJ2X29wX3VuYmxvY2tfYWxsCmxhYmVsIEVycm9yUFAg
YmRydl9kZWxfY2hpbGQKbGFiZWwgRXJyb3JQUCBiZHJ2X2NvX2RlbGV0ZV9maWxlCmxhYmVs
IEVycm9yUFAgYmRydl9pbnZhbGlkYXRlX2NhY2hlCmxhYmVsIEVycm9yUFAgYmFja3VwX2Rv
X2NoZWNrcG9pbnQKbGFiZWwgRXJyb3JQUCBiZHJ2X2NoZWNrX3JlcXVlc3QKbGFiZWwgRXJy
b3JQUCBjcmVhdGVfdG1wX2ZpbGUKbGFiZWwgRXJyb3JQUCBiZHJ2X2NoaWxkX3JlZnJlc2hf
cGVybXMKbGFiZWwgRXJyb3JQUCBibGtfZGV2X2NoYW5nZV9tZWRpYV9jYgpsYWJlbCBFcnJv
clBQIGJsb2NrX2pvYl9zZXRfc3BlZWRfbG9ja2VkCmxhYmVsIEVycm9yUFAgYmRydl9kaXJ0
eV9iaXRtYXBfc2hhMjU2CmxhYmVsIEVycm9yUFAgbmJkX3NlcnZlcl9zdGFydF9vcHRpb25z
CmxhYmVsIEVycm9yUFAgcWRpY3RfcmVuYW1lX2tleXMKbGFiZWwgRXJyb3JQUCByZXBsaWNh
dGlvbl9zdGFydF9hbGwKbGFiZWwgRXJyb3JQUCByZXBsaWNhdGlvbl9kb19jaGVja3BvaW50
X2FsbApsYWJlbCBFcnJvclBQIHJlcGxpY2F0aW9uX2dldF9lcnJvcl9hbGwKbGFiZWwgRXJy
b3JQUCByZXBsaWNhdGlvbl9zdG9wX2FsbApsYWJlbCBFcnJvclBQIHFtcF9jaGFyZGV2X29w
ZW5fZmlsZV9zb3VyY2UKbGFiZWwgRXJyb3JQUCBxZW11X2Nocl9mZV9pbml0CmxhYmVsIEVy
cm9yUFAgcWVtdV9jaHJfZmVfd2FpdF9jb25uZWN0ZWQKbGFiZWwgRXJyb3JQUCB3aW5fY2hy
X3NlcmlhbF9pbml0CmxhYmVsIEVycm9yUFAgcWVtdV9jaHJfY2hhbmdlCmxhYmVsIEVycm9y
UFAgcWVtdV9jaHJfd2FpdF9jb25uZWN0ZWQKbGFiZWwgRXJyb3JQUCBxZW11X2Nocl9wYXJz
ZV92YwpsYWJlbCBFcnJvclBQIHFjcnlwdG9faW5pdApsYWJlbCBFcnJvclBQIHFjcnlwdG9f
cmFuZG9tX2luaXQKbGFiZWwgRXJyb3JQUCB0Y2dfZXhlY19yZWFsaXplZm4KbGFiZWwgRXJy
b3JQUCBxZW11X3JhbV9yZXNpemUKbGFiZWwgRXJyb3JQUCBnX3VuaXhfZ2V0X3Bhc3N3ZF9l
bnRyeV9xZW11CmxhYmVsIEVycm9yUFAgYWNwaV90YWJsZV9hZGQKbGFiZWwgRXJyb3JQUCBh
c3BlZWRfc29jX3VhcnRfcmVhbGl6ZQpsYWJlbCBFcnJvclBQIGFzcGVlZF9zb2NfZHJhbV9p
bml0CmxhYmVsIEVycm9yUFAgYmxrY29uZl9ibG9ja3NpemVzCmxhYmVsIEVycm9yUFAgbWFj
aGluZV9ydW5fYm9hcmRfaW5pdApsYWJlbCBFcnJvclBQIGNwdV9leGVjX3JlYWxpemVmbgps
YWJlbCBFcnJvclBQIGN4bF9pbnRlcmxlYXZlX3dheXNfZW5jCmxhYmVsIEVycm9yUFAgY3hs
X2ludGVybGVhdmVfZ3JhbnVsYXJpdHlfZW5jCmxhYmVsIEVycm9yUFAgY3hsX2RvZV9jZGF0
X2luaXQKbGFiZWwgRXJyb3JQUCBjeGxfZG9lX2NkYXRfdXBkYXRlCmxhYmVsIEVycm9yUFAg
Y3hsX2Ztd3NfbGlua190YXJnZXRzCmxhYmVsIEVycm9yUFAgY3hsX2hvb2tfdXBfcHhiX3Jl
Z2lzdGVycwpsYWJlbCBFcnJvclBQIHNtYmlvc19lbnRyeV9hZGQKbGFiZWwgRXJyb3JQUCBp
MmNfc2xhdmVfcmVhbGl6ZV9hbmRfdW5yZWYKbGFiZWwgRXJyb3JQUCB4ODZfY3B1X25ldwps
YWJlbCBFcnJvclBQIGlzYV9yZWFsaXplX2FuZF91bnJlZgpsYWJlbCBFcnJvclBQIGxvYWRf
ZWxmX2hkcgpsYWJlbCBFcnJvclBQIG5taV9tb25pdG9yX2hhbmRsZQpsYWJlbCBFcnJvclBQ
IHB4Yl9jeGxfaG9va191cF9yZWdpc3RlcnMKbGFiZWwgRXJyb3JQUCBzcGFwcl9waGJfbnZn
cHVfc2V0dXAKbGFiZWwgRXJyb3JQUCBzcGFwcl9waGJfbnZncHVfc2V0dXAKbGFiZWwgRXJy
b3JQUCBtc2lfc2V0X21hc2sKbGFiZWwgRXJyb3JQUCBwY2lfcmVhbGl6ZV9hbmRfdW5yZWYK
bGFiZWwgRXJyb3JQUCBwZWZfa3ZtX2luaXQKbGFiZWwgRXJyb3JQUCBwZWZfa3ZtX3Jlc2V0
CmxhYmVsIEVycm9yUFAgcG52X3hzY29tX3JlYWxpemUKbGFiZWwgRXJyb3JQUCBzcGFwcl9y
ZWFsbG9jYXRlX2hwdApsYWJlbCBFcnJvclBQIHNwYXByX3NldF92Y3B1X2lkCmxhYmVsIEVy
cm9yUFAgc3BhcHJfdm9mX3Jlc2V0CmxhYmVsIEVycm9yUFAgc3BhcHJfaXJxX2luaXQKbGFi
ZWwgRXJyb3JQUCBzcGFwcl9pcnFfY2xhaW0KbGFiZWwgRXJyb3JQUCBzcGFwcl9pcnFfcmVz
ZXQKbGFiZWwgRXJyb3JQUCBzcGFwcl9pcnFfZ2V0X3BoYW5kbGUKbGFiZWwgRXJyb3JQUCBz
cGFwcl9pcnFfZmluZApsYWJlbCBFcnJvclBQIGt2bXBwY194aXZlX3Jlc2V0CmxhYmVsIEVy
cm9yUFAga3ZtcHBjX3hpdmVfc3luY19zb3VyY2UKbGFiZWwgRXJyb3JQUCBrdm1wcGNfeGl2
ZV9zeW5jaHJvbml6ZV9zdGF0ZQpsYWJlbCBFcnJvclBQIHZvZl9pbml0CmxhYmVsIEVycm9y
UFAgaWNwX3NldF9rdm1fc3RhdGUKbGFiZWwgRXJyb3JQUCBpY3Bfa3ZtX3JlYWxpemUKbGFi
ZWwgRXJyb3JQUCBpY3Nfc2V0X2t2bV9zdGF0ZV9vbmUKbGFiZWwgRXJyb3JQUCBpY3Nfc2V0
X2t2bV9zdGF0ZQpsYWJlbCBFcnJvclBQIGt2bXBwY194aXZlX3NvdXJjZV9yZXNldF9vbmUK
bGFiZWwgRXJyb3JQUCBrdm1wcGNfeGl2ZV9jcHVfY29ubmVjdApsYWJlbCBFcnJvclBQIGt2
bXBwY194aXZlX2NwdV9zeW5jaHJvbml6ZV9zdGF0ZQpsYWJlbCBFcnJvclBQIGt2bXBwY194
aXZlX2NwdV9nZXRfc3RhdGUKbGFiZWwgRXJyb3JQUCBrdm1wcGNfeGl2ZV9jcHVfc2V0X3N0
YXRlCmxhYmVsIEVycm9yUFAgcWRldl9yZWFsaXplCmxhYmVsIEVycm9yUFAgcWRldl9yZWFs
aXplX2FuZF91bnJlZgpsYWJlbCBFcnJvclBQIHFkZXZfaG90cGx1Z19hbGxvd2VkCmxhYmVs
IEVycm9yUFAgcWRldl91bnBsdWcKbGFiZWwgRXJyb3JQUCBxZGV2X3VucGx1Z19ibG9ja2Vk
CmxhYmVsIEVycm9yUFAgcWJ1c19yZWFsaXplCmxhYmVsIEVycm9yUFAgcWRldl9zZXRfcGFy
ZW50X2J1cwpsYWJlbCBFcnJvclBQIHFkZXZfc2hvdWxkX2hpZGVfZGV2aWNlCmxhYmVsIEVy
cm9yUFAgZXJyb3Jfc2V0X2Zyb21fcWRldl9wcm9wX2Vycm9yCmxhYmVsIEVycm9yUFAgcmVt
b3RlX3N5c21lbV9yZWNvbmZpZwpsYWJlbCBFcnJvclBQIG1wcWVtdV9tc2dfc2VuZApsYWJl
bCBFcnJvclBQIG1wcWVtdV9tc2dfcmVjdgpsYWJlbCBFcnJvclBQIHFtcF9ydGNfcmVzZXRf
cmVpbmplY3Rpb24KbGFiZWwgRXJyb3JQUCBzMzkwX3B2X2t2bV9pbml0CmxhYmVsIEVycm9y
UFAgczM5MF9wdl9pbml0CmxhYmVsIEVycm9yUFAgc3NpX3JlYWxpemVfYW5kX3VucmVmCmxh
YmVsIEVycm9yUFAgc3lzYnVzX3JlYWxpemUKbGFiZWwgRXJyb3JQUCBzeXNidXNfcmVhbGl6
ZV9hbmRfdW5yZWYKbGFiZWwgRXJyb3JQUCB1c2JfcmVhbGl6ZV9hbmRfdW5yZWYKbGFiZWwg
RXJyb3JQUCB1c2JfY2xhaW1fcG9ydApsYWJlbCBFcnJvclBQIHVzYl9kZXZpY2VfYXR0YWNo
CmxhYmVsIEVycm9yUFAgdXNiX2NoZWNrX2F0dGFjaApsYWJlbCBFcnJvclBQIHZmaW9fYmxv
Y2tfbXVsdGlwbGVfZGV2aWNlc19taWdyYXRpb24KbGFiZWwgRXJyb3JQUCB2ZmlvX2Jsb2Nr
X2dpb21tdV9taWdyYXRpb24KbGFiZWwgRXJyb3JQUCB2ZmlvX21pZ3JhdGlvbl9yZWFsaXpl
CmxhYmVsIEVycm9yUFAgdmhvc3RfdXNlcl9pbml0CmxhYmVsIEVycm9yUFAgdmlydGlvX2J1
c19kZXZpY2VfcGx1Z2dlZApsYWJlbCBFcnJvclBQIHZpcnRpb19ncHVfZGV2aWNlX3JlYWxp
emUKbGFiZWwgRXJyb3JQUCB2aXJ0aW9fc2NzaV9kYXRhcGxhbmVfc2V0dXAKbGFiZWwgRXJy
b3JQUCB4ZW5fYmFja2VuZF90cnlfZGV2aWNlX2Rlc3Ryb3kKbGFiZWwgRXJyb3JQUCBmYWls
b3Zlcl9yZXF1ZXN0X2FjdGl2ZQpsYWJlbCBFcnJvclBQIHByZWNvcHlfbm90aWZ5CmxhYmVs
IEVycm9yUFAgbW9uaXRvcl9pbml0X3FtcApsYWJlbCBFcnJvclBQIG1vbml0b3JfaW5pdF9o
bXAKbGFiZWwgRXJyb3JQUCBtb25pdG9yX2luaXQKbGFiZWwgRXJyb3JQUCBtb25pdG9yX2lu
aXRfb3B0cwpsYWJlbCBFcnJvclBQIG1vbml0b3JfZ2V0X2ZkCmxhYmVsIEVycm9yUFAgbW9u
aXRvcl9mZF9wYXJhbQpsYWJlbCBFcnJvclBQIGdwYTJodmEKbGFiZWwgRXJyb3JQUCBxbXBf
ZGV2aWNlX2FkZApsYWJlbCBFcnJvclBQIHFkZXZfc2V0X2lkCmxhYmVsIEVycm9yUFAgY29s
b19ub3RpZnlfZmlsdGVyc19ldmVudApsYWJlbCBFcnJvclBQIG5ldGRldl9hZGQKbGFiZWwg
RXJyb3JQUCBlcnJvcl9zZXRnX2ludGVybmFsCmxhYmVsIEVycm9yUFAgZXJyb3Jfc2V0Z19l
cnJub19pbnRlcm5hbApsYWJlbCBFcnJvclBQIGVycm9yX3NldGdfd2luMzJfaW50ZXJuYWwK
bGFiZWwgRXJyb3JQUCBlcnJvcl9zZXRnX2ZpbGVfb3Blbl9pbnRlcm5hbApsYWJlbCBFcnJv
clBQIGVycm9yX2ZyZWVfb3JfYWJvcnQKbGFiZWwgRXJyb3JQUCBlcnJvcl9zZXRfaW50ZXJu
YWwKbGFiZWwgRXJyb3JQUCBxbXBfY29tbWFuZF9hdmFpbGFibGUKbGFiZWwgRXJyb3JQUCB2
aXNpdF9jaGVja19zdHJ1Y3QKbGFiZWwgRXJyb3JQUCB2aXNpdF9jaGVja19saXN0CmxhYmVs
IEVycm9yUFAgdmlzaXRfdHlwZV9pbnQKbGFiZWwgRXJyb3JQUCB2aXNpdF90eXBlX2ludDgK
bGFiZWwgRXJyb3JQUCB2aXNpdF90eXBlX2Jvb2wKbGFiZWwgRXJyb3JQUCB2aXNpdF90eXBl
X3N0cgpsYWJlbCBFcnJvclBQIHZpc2l0X3R5cGVfYW55CmxhYmVsIEVycm9yUFAgYWNjZWxf
Y3B1X3JlYWxpemVmbgpsYWJlbCBFcnJvclBQIHFlbXVfY29uZmlnX2RvX3BhcnNlCmxhYmVs
IEVycm9yUFAgcWVtdV9yZWFkX2NvbmZpZ19maWxlCmxhYmVsIEVycm9yUFAgcWVtdV9ndWVz
dF9yYW5kb21fc2VlZF9tYWluCmxhYmVsIEVycm9yUFAgcWVtdV9ndWVzdF9nZXRyYW5kb20K
bGFiZWwgRXJyb3JQUCBoYml0bWFwX3NoYTI1NgpsYWJlbCBFcnJvclBQIGpvYl91c2VyX3Bh
dXNlX2xvY2tlZApsYWJlbCBFcnJvclBQIGpvYl91c2VyX3Jlc3VtZV9sb2NrZWQKbGFiZWwg
RXJyb3JQUCBqb2JfYXBwbHlfdmVyYl9sb2NrZWQKbGFiZWwgRXJyb3JQUCBqb2JfY29tcGxl
dGVfbG9ja2VkCmxhYmVsIEVycm9yUFAgam9iX3VzZXJfY2FuY2VsX2xvY2tlZApsYWJlbCBF
cnJvclBQIGpvYl9jb21wbGV0ZV9zeW5jX2xvY2tlZApsYWJlbCBFcnJvclBQIGpvYl9maW5h
bGl6ZV9sb2NrZWQKbGFiZWwgRXJyb3JQUCBqb2JfZGlzbWlzc19sb2NrZWQKbGFiZWwgRXJy
b3JQUCBqb2JfZmluaXNoX3N5bmNfbG9ja2VkCmxhYmVsIEVycm9yUFAga2V5dmFsX21lcmdl
CmxhYmVsIEVycm9yUFAgcWVtdV9zZXRfbG9nCmxhYmVsIEVycm9yUFAgcWVtdV9zZXRfbG9n
X2ZpbGVuYW1lCmxhYmVsIEVycm9yUFAgcWVtdV9zZXRfbG9nX2ZpbGVuYW1lX2ZsYWdzCmxh
YmVsIEVycm9yUFAgcWVtdV9zZXRfZGZpbHRlcl9yYW5nZXMKbGFiZWwgRXJyb3JQUCBxZW11
X2luaXRfbWFpbl9sb29wCmxhYmVsIEVycm9yUFAgbW9kdWxlX2xvYWQKbGFiZWwgRXJyb3JQ
UCBtb2R1bGVfbG9hZF9xb20KbGFiZWwgRXJyb3JQUCBxZW11X29wdHNfdmFsaWRhdGUKbGFi
ZWwgRXJyb3JQUCBxZW11X29wdHNfYWJzb3JiX3FkaWN0CmxhYmVsIEVycm9yUFAgcWVtdV9v
cGVuCmxhYmVsIEVycm9yUFAgcWVtdV9jcmVhdGUKbGFiZWwgRXJyb3JQUCBxZW11X3dyaXRl
X3BpZGZpbGUKbGFiZWwgRXJyb3JQUCBxZW11X3BsdWdpbl9sb2FkX2xpc3QKbGFiZWwgRXJy
b3JQUCBxZW11X3BsdWdpbl9sb2FkX2xpc3QKbGFiZWwgRXJyb3JQUCBpbmV0X3BhcnNlCmxh
YmVsIEVycm9yUFAgaW5ldF9jb25uZWN0CmxhYmVsIEVycm9yUFAgaW5ldF9jb25uZWN0X3Nh
ZGRyCmxhYmVsIEVycm9yUFAgdW5peF9saXN0ZW4KbGFiZWwgRXJyb3JQUCB1bml4X2Nvbm5l
Y3QKbGFiZWwgRXJyb3JQUCBzb2NrZXRfY29ubmVjdApsYWJlbCBFcnJvclBQIHNvY2tldF9s
aXN0ZW4KbGFiZWwgRXJyb3JQUCBzb2NrZXRfbGlzdGVuX2NsZWFudXAKbGFiZWwgRXJyb3JQ
UCBzb2NrZXRfZGdyYW0KbGFiZWwgRXJyb3JQUCBzb2NrZXRfYWRkcmVzc19wYXJzZV9uYW1l
ZF9mZApsYWJlbCBFcnJvclBQIHRocm90dGxlX2lzX3ZhbGlkCmxhYmVsIEVycm9yUFAgeWFu
a19yZWdpc3Rlcl9pbnN0YW5jZQpsYWJlbCBFcnJvclBQIG9iamVjdF9zZXRfcHJvcHMKbGFi
ZWwgRXJyb3JQUCBvYmplY3Rfc2V0X3Byb3B2CmxhYmVsIEVycm9yUFAgdXNlcl9jcmVhdGFi
bGVfY29tcGxldGUKbGFiZWwgRXJyb3JQUCB1c2VyX2NyZWF0YWJsZV9hZGRfcWFwaQpsYWJl
bCBFcnJvclBQIHVzZXJfY3JlYXRhYmxlX2FkZF9mcm9tX3N0cgpsYWJlbCBFcnJvclBQIHVz
ZXJfY3JlYXRhYmxlX2RlbApsYWJlbCBFcnJvclBQIG1vbml0b3JfYWRkX2JsawpsYWJlbCBF
cnJvclBQIGJsa19pbnNlcnRfYnMKbGFiZWwgRXJyb3JQUCBibGtfcmVwbGFjZV9icwpsYWJl
bCBFcnJvclBQIGJsa19hY3RpdmF0ZQpsYWJlbCBFcnJvclBQIGJsa19zZXRfb25fZXJyb3IK
bGFiZWwgRXJyb3JQUCBibGtfb3BfaXNfYmxvY2tlZApsYWJlbCBFcnJvclBQIGJsa19yZWdp
c3Rlcl9idWYKbGFiZWwgRXJyb3JQUCBibGtfbWFrZV9lbXB0eQpsYWJlbCBFcnJvclBQIGJs
a19lcnJvcl9hY3Rpb24KbGFiZWwgRXJyb3JQUCBpY291bnRfY29uZmlndXJlCmxhYmVsIEVy
cm9yUFAgcWVtdV9mZHRfbm9kZV91bml0X3BhdGgKbGFiZWwgRXJyb3JQUCBzZXRfbnVtYV9v
cHRpb25zCmxhYmVsIEVycm9yUFAgcWVtdV9zb2NrZXRfdW5zZWxlY3QKbGFiZWwgRXJyb3JQ
UCBxdGVzdF9zZXJ2ZXJfaW5pdApsYWJlbCBFcnJvclBQIHFlbXVfc3lzdGVtX3dha2V1cF9y
ZXF1ZXN0CmxhYmVsIEVycm9yUFAgcGFyc2Vfc2FuZGJveApsYWJlbCBFcnJvclBQIGNoZWNr
X2Jvb3RfaW5kZXgKbGFiZWwgRXJyb3JQUCB2YWxpZGF0ZV9ib290ZGV2aWNlcwpsYWJlbCBF
cnJvclBQIHFlbXVfYm9vdF9zZXQKbGFiZWwgRXJyb3JQUCB0cG1fYmFja2VuZF9pbml0Cmxh
YmVsIEVycm9yUFAgcWVtdV9tb3VzZV9zZXQKbGFiZWwgRXJyb3JQUCB2bmNfZGlzcGxheV9p
bml0CmxhYmVsIEVycm9yUFAgdm5jX2Rpc3BsYXlfb3BlbgpsYWJlbCBFcnJvclBQIHZuY19p
bml0X2Z1bmMKbGFiZWwgRXJyb3JQUCB2bmNfZGlzcGxheV9yZWxvYWRfY2VydHMKbGFiZWwg
RXJyb3JQUCB2bmNfZGlzcGxheV91cGRhdGUKbGFiZWwgRXJyb3JQUCBxZW11X3VzaW5nX2Ri
dXNfZGlzcGxheQpsYWJlbCBFcnJvclBQIGVnbF9pbml0CmxhYmVsIEVycm9yUFAgcWVtdV91
c2luZ19zcGljZQo=

--------------yeRmNb8vGPYXeD4iyzAyNQd6--



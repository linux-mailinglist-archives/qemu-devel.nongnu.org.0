Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC16A1F06
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaQ9-0005hF-Nz; Fri, 24 Feb 2023 10:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVaPe-0005RJ-AT
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:10 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVaPb-0005lk-QW
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:10 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r7so14230678wrz.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XzLi43pwUgsoKlJm/jrmkdpLzl4ZHpl4LUKJmAlPEbU=;
 b=XCOKpgxVeVSIyuG53LbdU4jljNNhWZuvk4OX0cuWSo0aqn8jWKHJZxaTjO2KDJ9d2i
 IWdo2scmKxd2iIdU30lWALd5N1Bm0555DPxulX/Z8p3zAxuOnRAOtIPFWuxYSwXA/+QG
 cJBi+5nHaVstNw3q/zYyZQb9ijueh50yrt8/3TKCvMDmDLr8fQrVx7ffns3+/PQqUydg
 D+U34oFhaFHQQEa25DinSPqzNizl4pl+4gxSzrrOxmaQmC9MqvYblZkTZoDEOzibw6jJ
 Pi1m1PWMebt8XtFSRxIMWvd6Ski97+bk77UHPFpP3XJHGLpa2pS85Ky7ny3U6Kg/r6BA
 jUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XzLi43pwUgsoKlJm/jrmkdpLzl4ZHpl4LUKJmAlPEbU=;
 b=ehKri3JS9DgtWab68VjQIMPI2aDLq1biLUoVA6ByVsLk1KJTy6LVqhKYFTtv5qnHm3
 ry01650lk3coFMO+mOEvO/nNaW+kp25ITGLUyUSuBgQIfeXIbMpkTveMjgAlxJpHgFJE
 oLPSoyf69Scqe/pABDfG5dca9UipaG/ov/nUeW8kMQBeIstWIX6oCiL/3XAQX1FcDDjF
 +I9R3t26QAfWgw7BKPUmuQyq6PX/V0rokc7+q3esbKIKQUMAOD8SktwtU0iMuRCL1xbS
 QNb9R97CQu3l7kVk/CIenecJpDam7UOuoPTpe5w+YkH2oqfxQjMiCIoCCSUP0dA+saFZ
 LsnA==
X-Gm-Message-State: AO0yUKUx6G8be6co8aZyiiu0WhWvAmCw7STQoWkLVWGmVf0XJH5zvQ9/
 OuYstZ6TC6oOu7bw7qxy8szuOL1jGyjppzbl
X-Google-Smtp-Source: AK7set/EWBEUzHUlocWTmiX3gOndFlGxmCQzQdGmGasIGadpIEzKa35Rrr1SYpiBW0fXnakOVdYmzw==
X-Received: by 2002:a05:6000:10c:b0:2c7:1d8b:bb69 with SMTP id
 o12-20020a056000010c00b002c71d8bbb69mr2079057wrx.17.1677254105708; 
 Fri, 24 Feb 2023 07:55:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a056000118400b002c5544b3a69sm10097959wrx.89.2023.02.24.07.55.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 07:55:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] qapi: Generate enum count as definition in
 gen_enum_lookup()
Date: Fri, 24 Feb 2023 16:54:51 +0100
Message-Id: <20230224155451.20211-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224155451.20211-1-philmd@linaro.org>
References: <20230224155451.20211-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QAPI's gen_enum() generates QAPI enum values and the number
of this values (as foo__MAX).
The number of entries in an enum type is not part of the
enumerated values, but we generate it as such. See for
example:

  typedef enum OnOffAuto {
      ON_OFF_AUTO_AUTO,
      ON_OFF_AUTO_ON,
      ON_OFF_AUTO_OFF,
      ON_OFF_AUTO__MAX,        <---------
  } OnOffAuto;

Instead of declaring the enum count as the last enumerated
value, #define it, so it is not part of the enum. The previous
example becomes:

  typedef enum OnOffAuto {
      ON_OFF_AUTO_AUTO,
      ON_OFF_AUTO_ON,
      ON_OFF_AUTO_OFF,
  #define ON_OFF_AUTO__MAX 3   <---------
  } OnOffAuto;

Since Clang enables the -Wswitch warning by default [*], remove all
pointless foo__MAX cases in switch statement, in order to avoid:

 audio/audio.c:2231:10: error: case value not in enumerated type 'AudioFormat' (aka 'enum AudioFormat') [-Wswitch]
    case AUDIO_FORMAT__MAX:
         ^
 ui/input.c:233:14: error: case value not in enumerated type 'KeyValueKind' (aka 'enum KeyValueKind') [-Wswitch]
        case KEY_VALUE_KIND__MAX:
             ^
 ...

[*] https://clang.llvm.org/docs/DiagnosticsReference.html#wswitch
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 audio/audio.c          |  6 ------
 audio/audio_template.h |  3 ---
 migration/migration.c  |  2 --
 replay/replay-input.c  | 12 ------------
 scripts/qapi/types.py  | 11 +++++++----
 softmmu/tpm-hmp-cmds.c |  2 --
 ui/input-linux.c       |  4 ----
 ui/input.c             |  6 ------
 8 files changed, 7 insertions(+), 39 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 4290309d18..57130c44f6 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2079,9 +2079,6 @@ void audio_create_pdos(Audiodev *dev)
         CASE(SPICE, spice, );
 #endif
         CASE(WAV, wav, );
-
-    case AUDIODEV_DRIVER__MAX:
-        abort();
     };
 }
 
@@ -2227,9 +2224,6 @@ int audioformat_bytes_per_sample(AudioFormat fmt)
     case AUDIO_FORMAT_S32:
     case AUDIO_FORMAT_F32:
         return 4;
-
-    case AUDIO_FORMAT__MAX:
-        ;
     }
     abort();
 }
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 42b4712acb..58e1255d7a 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -369,9 +369,6 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
 #endif
     case AUDIODEV_DRIVER_WAV:
         return dev->u.wav.TYPE;
-
-    case AUDIODEV_DRIVER__MAX:
-        break;
     }
     abort();
 }
diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..bdadab3b5e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2220,8 +2220,6 @@ bool migration_is_idle(void)
     case MIGRATION_STATUS_DEVICE:
     case MIGRATION_STATUS_WAIT_UNPLUG:
         return false;
-    case MIGRATION_STATUS__MAX:
-        g_assert_not_reached();
     }
 
     return false;
diff --git a/replay/replay-input.c b/replay/replay-input.c
index 1147e3d34e..c6de8e33ac 100644
--- a/replay/replay-input.c
+++ b/replay/replay-input.c
@@ -38,9 +38,6 @@ void replay_save_input_event(InputEvent *evt)
             replay_put_dword(key->key->u.qcode.data);
             replay_put_byte(key->down);
             break;
-        case KEY_VALUE_KIND__MAX:
-            /* keep gcc happy */
-            break;
         }
         break;
     case INPUT_EVENT_KIND_BTN:
@@ -58,9 +55,6 @@ void replay_save_input_event(InputEvent *evt)
         replay_put_dword(move->axis);
         replay_put_qword(move->value);
         break;
-    case INPUT_EVENT_KIND__MAX:
-        /* keep gcc happy */
-        break;
     }
 }
 
@@ -89,9 +83,6 @@ InputEvent *replay_read_input_event(void)
             evt.u.key.data->key->u.qcode.data = (QKeyCode)replay_get_dword();
             evt.u.key.data->down = replay_get_byte();
             break;
-        case KEY_VALUE_KIND__MAX:
-            /* keep gcc happy */
-            break;
         }
         break;
     case INPUT_EVENT_KIND_BTN:
@@ -109,9 +100,6 @@ InputEvent *replay_read_input_event(void)
         evt.u.abs.data->axis = (InputAxis)replay_get_dword();
         evt.u.abs.data->value = replay_get_qword();
         break;
-    case INPUT_EVENT_KIND__MAX:
-        /* keep gcc happy */
-        break;
     }
 
     return QAPI_CLONE(InputEvent, &evt);
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index c39d054d2c..b24bcb40ad 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -86,16 +86,13 @@ def gen_enum_lookup(name: str,
 def gen_enum(name: str,
              members: List[QAPISchemaEnumMember],
              prefix: Optional[str] = None) -> str:
-    # append automatically generated _MAX value
-    enum_members = members + [QAPISchemaEnumMember('_MAX', None)]
-
     ret = mcgen('''
 
 typedef enum %(c_name)s {
 ''',
                 c_name=c_name(name))
 
-    for memb in enum_members:
+    for memb in members:
         ret += memb.ifcond.gen_if()
         ret += mcgen('''
     %(c_enum)s,
@@ -103,6 +100,12 @@ def gen_enum(name: str,
                      c_enum=c_enum_const(name, memb.name, prefix))
         ret += memb.ifcond.gen_endif()
 
+    ret += mcgen('''
+#define %(c_name)s %(c_length)s
+''',
+                 c_name=c_enum_const(name, '_MAX', prefix),
+                 c_length=len(members))
+
     ret += mcgen('''
 } %(c_name)s;
 ''',
diff --git a/softmmu/tpm-hmp-cmds.c b/softmmu/tpm-hmp-cmds.c
index 9ed6ad6c4d..5a354cf6ac 100644
--- a/softmmu/tpm-hmp-cmds.c
+++ b/softmmu/tpm-hmp-cmds.c
@@ -52,8 +52,6 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
             teo = ti->options->u.emulator.data;
             monitor_printf(mon, ",chardev=%s", teo->chardev);
             break;
-        case TPM_TYPE__MAX:
-            break;
         }
         monitor_printf(mon, "\n");
         c++;
diff --git a/ui/input-linux.c b/ui/input-linux.c
index e572a2e905..a6e7574422 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -120,10 +120,6 @@ static bool input_linux_check_toggle(InputLinux *il)
         return (il->keydown[KEY_LEFTCTRL] ||
                 il->keydown[KEY_RIGHTCTRL]) &&
             il->keydown[KEY_SCROLLLOCK];
-
-    case GRAB_TOGGLE_KEYS__MAX:
-        /* avoid gcc error */
-        break;
     }
     return false;
 }
diff --git a/ui/input.c b/ui/input.c
index f2d1e7a3a7..ca8f49a403 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -230,9 +230,6 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
             name = QKeyCode_str(key->key->u.qcode.data);
             trace_input_event_key_qcode(idx, name, key->down);
             break;
-        case KEY_VALUE_KIND__MAX:
-            /* keep gcc happy */
-            break;
         }
         break;
     case INPUT_EVENT_KIND_BTN:
@@ -250,9 +247,6 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
         name = InputAxis_str(move->axis);
         trace_input_event_abs(idx, name, move->value);
         break;
-    case INPUT_EVENT_KIND__MAX:
-        /* keep gcc happy */
-        break;
     }
 }
 
-- 
2.38.1


